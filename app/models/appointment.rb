class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor


  # @specialities = @doc.appointments

  # @teachers = @course.enrollments.where(role: 'teacher')
  #   @tas = @course.enrollments.where(role: 'ta')
  #   @students = @course.enrollments.where(role: 'student')
end
