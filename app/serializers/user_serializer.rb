class UserSerializer < BaseSerializer
  attributes :first_name, :last_name, :email, :rating
  has_many :preferred_locations
end
