module CoursesHelper
  def course_author(course)
    user_signed_in? && current_user.id == course.user_id
  end

  def content_author(content)
    user_signed_in? && current_user.id == content.user_id
  end
end
