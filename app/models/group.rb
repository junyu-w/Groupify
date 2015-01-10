class Group < ActiveRecord::Base
  serialize :student_list,Array
  has_one :topic
  has_many :posts
  has_one :instructor_answer

  validates :name, presence: true, length: 
    { 
      minimum: 1, 
      maximum: 20,
      tokenizer: lambda { |str| str.split(/\s+/) },
      too_short: "must have at least %{count} words",
      too_long: "must have at most %{count} words"
    };

  validates :topic_id, presence: true
end
