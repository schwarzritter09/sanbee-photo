require 'twitter'

class TwitterClient
  
  def destroy(article)
    begin
      if article.tweetid?
        
        client = get_client
        client.destroy_status(article.tweetid)
        article.tweetid = nil
        article.save
      end
    rescue => e
      Rails.logger.error "<<twitter.rake::tweet.destroy ERROR : #{e.message}>>"
    end

  end
  
  def tweet(article)
    begin
      text = make_tweet(article)
      
      client = get_client
      
      media_ids = Array.new
      
      media_ids.push(client.upload(open(article.obverse_photo.file.file))) if article.obverse_photo.present?
      media_ids.push(client.upload(open(article.reverse_photo.file.file))) if article.reverse_photo.present?
      
      tweet = client.update(text, :media_ids => media_ids.join(','))
      
      article.tweetid = tweet.id
      article.save
    rescue => e
      Rails.logger.error "<<twitter.rake::tweet.update ERROR : #{e.message}>>"
    end
  end
  
  def make_tweet(article)
    
      tweet = "投稿されました 譲:#{article.member.name} 求:#{article.request_member_list}"
      routes = Rails.application.routes.url_helpers
      url = routes.url_for(:controller => "articles", :action => "show", :id => article.id, :host => SanbeePhoto::Application.config.tweet_host, :only_path => false)
      username = "@" + article.user.username
      hashtag = "#3Bjr写真交換"
      
      # URL,アカウント名を含めて140文字をオーバーする場合、本文を削る
      while true do
        if (tweet.length + url.length + username.length + hashtag.length + 3) > 140 then
          tweet = tweet[0..tweet.length-1].to_s
        else
          break;
        end
      end
      
      tweet + "\n" + url + "\n" + username + "\n" + hashtag
  end
  
  def get_client
    
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = SanbeePhoto::Application.config.tweet_consumer_key
      config.consumer_secret = SanbeePhoto::Application.config.tweet_consumer_secret
      config.access_token = SanbeePhoto::Application.config.tweet_access_token
      config.access_token_secret =  SanbeePhoto::Application.config.tweet_access_token_secret
    end
    
    client
  end
end