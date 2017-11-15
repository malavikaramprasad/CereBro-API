class UserSerializer < BaseSerializer
  attributes :first_name, :last_name, :email
  has_many :preferred_locations
end
