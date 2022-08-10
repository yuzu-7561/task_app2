class Reservation < ApplicationRecord
    belongs_to :room
    belongs_to :user

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :num_people, presence: true
    validate :start_end_check
    validate :pretend_ago

    def start_end_check
        if end_date.present? && start_date.present?
            if end_date < start_date
                errors.add(:end_date, "は開始日より前の日付を登録できません")
            end
        end
    end

    def pretend_ago
        errors.add(:start_date, "は本日より前の日付を登録できません") if start_date < Date.today
    end

    
end
