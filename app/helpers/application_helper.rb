module ApplicationHelper

  def content_elements method_id
    method = WritingMethod.find_by_id(method_id)
    case method.code
    when 1
      'content_how_to_write'
    when 2
      'content_write_following_eye'
    when 3
      'content_write_following_listening'
    when 4
      'content_write_following_picture'
    else
      'content_how_to_write'
    end


  end

end
