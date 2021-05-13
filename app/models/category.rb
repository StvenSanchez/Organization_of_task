# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
    has_many :tasks
    validates :name, :description, presence: true ### Validamos que estos datos no se dejen en blanco
    validates :name, uniqueness: { case_sensitive: false } ## Validamos que no se repita el nombre 
end
