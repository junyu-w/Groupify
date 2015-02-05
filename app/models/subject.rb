class Subject < ActiveRecord::Base
  serialize :instructor_list,Array
  serialize :student_list, Array

  belongs_to :User
  has_many :topics
  has_many :groups

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true 

end
