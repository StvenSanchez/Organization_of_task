# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  
  belongs_to :category
  belongs_to :owner, class_name: 'User'


  validates :name, :description, presence: true ### Validamos que estos datos no se dejen en blanco
  validates :name, uniqueness: { case_sensitive: false } ## Validamos que no se repita el nombre 
  validate :due_date_validity

  def due_date_validity
    return if due_date.blank? ### Validamos que due_date no este en blanco 
    return if due_date > Date.today  ## Validamos que la fecha sea mayor de hoy, que no se pueda ingresar una fecha antes de hoy

    errors.add :due_date, message: 'Error select a valid date ' ## agregamos el error y el mensaje 
  end
end
