root = '/opt/app'
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen '/tmp/unicorn.app.sock'
worker_processes 4
timeout 40
preload_app true

before_fork do |server, _worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
  # Quit the old unicorn process
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    puts "We've got an old pid and server pid is not the old pid"
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
      puts 'killing master process (good thing tm)'
    rescue Errno::ENOENT, Errno::ESRCH
      puts 'unicorn master already killed'
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  port = 5000 + worker.nr
  child_pid = server.config[:pid].sub('.pid', ".#{port}.pid")
  system("echo #{Process.pid} > #{child_pid}")
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
