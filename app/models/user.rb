require_relative "application_record"

class User < ApplicationRecord
  has_many :tasks

  def add_xp(amount)
    self.xp += amount
    self.total_xp += amount
    while self.xp >= self.xp_required
      self.xp -= self.xp_required
      self.xp_required = (self.xp_required + self.xp_required * 1 / Math.sqrt(self.level)).round
      self.level += 1
    end
    self.save
  end
end
