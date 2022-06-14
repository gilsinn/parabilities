if @comment.persisted?
  json.form json.partial!("form.html.erb", locals: {review: @review, comment: Comment.new})
  json.inserted_item json.partial!("reviews/comment.html.erb", locals: {comment: @comment})
else
  json.form json.partial!("form.html.erb", locals: {review: @review, comment: @comment})
end
