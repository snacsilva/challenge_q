class Leader < ApplicationRecord
  belongs_to :employee

  before_create :same_enterprise?, :alredy_has_a_leader?
  
  def all_leds_from_leader leader_id
    Leader.where(employee_id: leader_id)
  end

  def alredy_has_a_leader?
    return errors.add :base, 'Alredy has a leader' if Leader.find_by(led_id: led_id)
  end
  
  def same_enterprise?
    raise 'Is not the same enterprise' if employee.enterprise_id != led.enterprise_id
  end
  
  def led
    Employee.find(led_id)
  end

end