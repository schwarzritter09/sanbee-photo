module ApplicationHelper
  def image_set_tag(source, srcset = {}, options = {})
    srcset = srcset.map { |src, size| "#{path_to_image(src)} #{size}" }.join(', ')
    image_tag(source, options.merge(srcset: srcset))
  end

  def twitter_intent_for(article)
    intent_url = "https://twitter.com/intent/tweet"
    intent_url += "?screen_name=" + article.user.username
    intent_url += "&url=" + url_for(:controller => "articles", :action => "show", :id => article.id, :only_path => false)

    intent_url
  end

  def twitter_share_for(article)
    share_url = "https://twitter.com/share"
    share_url += "?text=" + "【拡散希望】譲:#{article.member.name} 求:#{require_member_list article}"
    share_url += "&url=" + url_for(:controller => 'articles', :action => 'show', :id => article.id, :only_path => false)
    share_url += "&hashtags=3Bjr写真交換"

    share_url
  end

  def require_member_list(article)
    names = ""
    article.members.each_with_index do |requestmember, i|
      names += requestmember.name
      names += (i+1 >= @article.members.count) ? '' : ','
    end

    names
  end


  def twitter_mention_tag(article)
    link_to("@#{article.user.username}さんへツイート",
            twitter_intent_for(article),
            :class => "tweetbtn",
            :target => "_blank")
  end

  def twitter_share_tag(article)
   link_to("拡散ツイート",
           twitter_share_for(article),
           :class => 'tweetbtn',
           :target => '_blank',
           :id => 'tweetbtn')
  end
end
