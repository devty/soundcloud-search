require HTTParty
class MyTest




  base_uri 'http://api.sandbox-soundcloud.com'
  default_params :output => 'json'
  format :json
  CONSUMER_KEY = 'SvMf8GMk3a75dOKJRfhaA'

#  def register_sc
#    @sc_client = Soundcloud.register({:consumer_key => , :site => "http://api.sandbox-soundcloud.com"})
#
#  end

  #def find_tracks_from_namm
    @namm_iphone_tracks = get("/tracks.json?consumer_key=#{CONSUMER_KEY}q=namm&tag_list=soundcloud:source=iphone-record&created_at[to]=#{DateTime.now}")
    puts @namm_iphone_tracks

 # end


end
