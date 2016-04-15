require 'factory_girl_rails'
require 'spec_helper'
require 'rails_helper'
require 'rspec'
require 'rubygems'
include ReservationHelper

unless Service.find_by url: 'localhost'
  service = FactoryGirl.create :service, name: 'dev stuff', url: 'localhost'
  item_type = FactoryGirl.create :item_type, name: 'programmer', creator: service
  item = FactoryGirl.create :item, name: 'Tom', reservable: true, item_type: item_type
  FactoryGirl.create :reservation, item: item, start_datetime: Time.parse('15/1/11').iso8601, 
                                   end_datetime: Time.parse('18/1/5').iso8601, creator: service
end
