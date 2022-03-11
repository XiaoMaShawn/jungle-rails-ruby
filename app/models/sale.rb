class Sale < ActiveRecord::Base

  #AR scope
  def self.active
    where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    self.ends_on < Date.current
  end

  def upcoming?
    self.starts_on > Date.current
  end

  def active?
    # self.starts_on < Date.current && Date.current < self.ends_on
    !upcoming? && !finished?
  end
end
