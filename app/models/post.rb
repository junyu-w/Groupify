class Post < ActiveRecord::Base

  belongs_to :Group
  has_many :discussions

  validates :summary, presence: true, length:
    {
      minimum: 1,
      maximum: 20,
      tokenizer: lambda { |str| str.split(/\s+/) },
      too_short: "must have at least %{count} words",
      too_long: "must have at most %{count} words"
    };
  validates :content, presence: true, length:
    {
      minimum: 1,
      maximum: 500,
      tokenizer: lambda { |str| str.split(/\s+/) },
      too_short: "must have at least %{count} words",
      too_long: "must have at most %{count} words"
    };

end
