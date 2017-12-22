module BlogsHelper
  def url_new_or_edit
    if action_name == "new" || action_name == "new_confirm"
      new_confirm_blogs_path
    elsif action_name = "edit" || action_name == "edit_confirm"
      edit_confirm_blog_path(@blog.id)
    end
  end
  
  def method_new_or_edit
    if action_name == "new" || action_name == "new_confirm"
      :post
    elsif action_name = "edit" || action_name == "edit_confirm"
      :patch
    end
  end
end
