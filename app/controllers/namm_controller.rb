require 'httparty'
#require 'json'
#require 'uri'

class NammController < ApplicationController
  respond_to :html
  def index
    now = params[:time] || Time.now.strftime("%Y-%m-%d %H:%M")
    query = params[:q] || "namm"
    tag_list = params[:tags] || "soundcloud:source=iphone-record"
    limit = params[:limit] || 10
    parameters = {
      :q => query,
      :tag_list => tag_list,
      :consumer_key => SoundCloudParty::CONSUMER_KEY,
      :limit => limit,
      :order => "created_at",
      "created_at[to]" => now
    }
    @namm_iphone_tracks = SoundCloudParty.get("http://api.soundcloud.com/tracks.json", {:query => parameters})
    puts @namm_iphone_tracks
    respond_with @namm_iphone_tracks
  end
end

class SoundCloudParty
  include HTTParty
  base_uri 'http://api.soundcloud.com'
  default_params :output => 'json'
  format :json
  CONSUMER_KEY = 'SvMf8GMk3a75dOKJRfhaA'
end