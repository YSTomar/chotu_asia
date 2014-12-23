class Location < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address  do |obj,geo|
    obj.city = geo.first.city
    obj.state = geo.first.state
    obj.country = geo.first.country
    obj.latitude = geo.first.latitude
    obj.longitude = geo.first.longitude
  end
  before_save :geocode
end
