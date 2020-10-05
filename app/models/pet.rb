class Pet < ApplicationRecord
  belongs_to :location, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :name, presence: true
  validates :breed, presence: true
  validates :animal_type, presence: true
  validates :age, presence: true

  def self.search_by(search_term)
    where("LOWER(name) LIKE :search_term
           OR LOWER(breed) LIKE :search_term
           OR LOWER(age) LIKE :search_term
           OR LOWER(animal_type) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end

end
