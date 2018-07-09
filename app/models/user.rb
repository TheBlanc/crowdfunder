class User < ActiveRecord::Base
has_secure_password
has_many :pledges
#if you  give customize name to the association and it goes through other model, you have to
#specify a class_name :Model , and source : model_lowercase -name of the association.
has_many :backed_projects, through: :pledges, class_name: Project, source: :project #can be custom name
# you have to give a class name to  point to the right model.
has_many :owned_projects, class_name: Project

  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true


end
