module AdminViewHelper
  def attr_link(attribute, object)
    if link = object.send("#{attribute}_link")
      link_to(object.send(attribute), link)
    else
      '--'
    end
  end
end
