class UserSerializer < BaseSerializer
  attributes :first_name, :last_name, :email, :rating, :x_coordinate, :y_coordinate, :start_time, :end_time
  has_many :preferred_locations
end
