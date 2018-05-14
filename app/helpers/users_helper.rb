module UsersHelper

  # adapted from Micheal Hartl, https://www.railstutorial.org/book/sign_up
  # image for a given user. Render this from the user.grav_url from the db
  # only if an image has been uploaded
  def prof_pic_for(user)
    # we don't need an id for the user's grav url.
    # prof_pic_id = Digest::MD5::hexdigest(user.username)
    if user.grav_url.nil?
      image_tag("", alt: user.username, class: "gravatar")
    else
      prof_pic_url = user.grav_url
      image_tag(prof_pic_url, alt: user.username, class: "gravatar")
    end
  end
end
