module ApplicationHelper
  include MobileConcerns::Helpers

#  def document_ready(content)
#    html = %{ $(function(){#{content}})}
#    content_for(:document_ready){ javascript_tag(html) }
#  end

  def link_to_submit(text)
    link_to_function text, "$(this).closest('form').submit()"
  end

end
