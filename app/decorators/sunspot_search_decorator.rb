require 'active_model'

# @author anzaika@gmail.com
class SunspotSearchDecorator < Draper::Decorator
  delegate_all
  delegate :total, to: :object
  delegate :size, to: 'object.total'
  delegate :count, to: 'object.total'
  delegate :page, :per_page, to: 'object.query'
  delegate :length, :first_page?, :last_page?, to: 'object.results'
end
