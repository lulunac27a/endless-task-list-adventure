class Task < ApplicationRecord
  belongs_to :user

  def complete
    user.add_xp(1)
  end
end
