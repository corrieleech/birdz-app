class Checklist < ApplicationRecord
  belongs_to :user
  has_many :likely_birds
  has_many :birds, through: :likely_birds
  
  validates :name, length: { minimum: 2 }

  def populate_possible_birds
    #method takes in a user date and pulls historic bird observation data for the week before and the week after and returns unique possible sightings if they're within 1 hour +/- of the entered time
    checklist_id = self.id
    possible_sightings = []
    user_date = self.time
    user_date = user_date - 7.days

    14.times do
      day_sightings = HTTP.headers("x-ebirdapitoken" => Rails.application.credentials.ebird.api_key).get("https://api.ebird.org/v2/data/obs/#{self.locId}/historic/#{user_date.year}/#{user_date.month}/#{user_date.day}/").parse(:json)
      day_sightings.each do |sighting|
        sighting_time = sighting["obsDt"].to_datetime
        if sighting_time > user_date - 1.hour && sighting_time < user_date + 1.hour
          possible_sightings << sighting
        end
      end
      user_date += 1.days
    end
    possible_sightings = possible_sightings.uniq { |sighting| sighting["speciesCode"]}

    possible_sightings.each do |bird|
      db_bird = Bird.find_by(speciesCode: bird["speciesCode"])
      if db_bird == nil
        db_bird = Bird.create(speciesCode: bird["speciesCode"], comName: bird["comName"], sciName: bird["sciName"])
      end 
      checklist_addition = LikelyBird.create(
        checklist_id: checklist_id,
        bird_id: db_bird.id,
        has_seen: false
      )
    end
  end

end
