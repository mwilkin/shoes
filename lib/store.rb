class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  before_save(:titleize_name)
  validates(:name, :presence => true)

  private
    define_method(:titleize_name) do
      self.name = name.downcase.titleize
    end
end
