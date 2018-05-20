module CommentsHelper
  def get_news_title(news_id)
    Article.find(news_id).title
  end
end
