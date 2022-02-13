class Leader < ApplicationRecord
  belongs_to :employee

  validate :same_enterprise?, :alredy_has_a_leader?, :on => :create
  
  def all_leds_from_leader leader_id
    Leader.where(employee_id: leader_id)
  end

  def alredy_has_a_leader?
    if Leader.find_by(led_id: led_id)
      raise 'Alredy has a leader'
    end
  end
  
  def same_enterprise?
    if employee.enterprise_id != led.enterprise_id
      raise 'Is not the same enterprise'
    end
  end
  
  def led
    Employee.find(led_id)
  end

end