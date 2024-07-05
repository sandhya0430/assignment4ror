class ArticlePresenter
  def initialize(article)
    @article = article
  end

  def as_json(*)
    {
      id: @article.id,
      title: @article.title,
      content: @article.content,
      author: @article.user.email
    }
  end
end
