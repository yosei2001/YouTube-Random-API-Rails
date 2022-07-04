class YoutubeController < ApplicationController
    
    require 'google/apis/youtube_v3'
    require 'active_support/all'
  
    GOOGLE_API_KEY =  ENV['youtube_api'] 

  
      def find_videos(keyword, after: 1.months.ago, before: Time.now)
        service = Google::Apis::YoutubeV3::YouTubeService.new
        service.key = GOOGLE_API_KEY
    
        next_page_token = nil
  
        opt = {
          q: keyword,
          type: 'video',
          max_results: 1,
          order: :date,
          event_type: 'live',
        }

        service.list_searches(:snippet, **opt)
      end

      def index

        @tweets = Tweet.all

      end
  
      def new
        @tweet = Tweet.new
      end
    
      def create
        
          @tweet = Tweet.new(tweet_params)
        if tweet.save  
          redirect_to :action => "new"
        else
          redirect_to :action => "index"
        end
      end
    
      def main
          
          # @suggest = Tweet.where('id >= ?', rand(Tweet.first.id..Tweet.last.id) ).first.body
          @suggest = Tweet.offset(rand(Tweet.count)).first.body
          #Tweetモデルからランダムにデータを複数取り出すコード
          #そのうち1つ目を抽出するコード
          
          @youtube_data = find_videos( @suggest )

      end


      private
      def tweet_params
        params.require(:tweet).permit(:body)
      end

  end