module ProfilesHelper

  def has_profile?

    if (current_user.role == '0')
      !current_user.profile.nil?
    end
  end

  def has_experiences?
    if (current_user.role == '0')
      !current_user.profile.experiences.nil? && current_user.profile.experiences.size>0
    end
  end

  def has_certifications?
    if (current_user.role == '0')
      !current_user.profile.certifications.nil? && current_user.profile.certifications.size>0
    end
  end

  def has_educations?
    if (current_user.role == '0')
      !current_user.profile.educations.nil? && current_user.profile.educations.size>0
    end
  end

  def has_trainings?
    if (current_user.role == '0')
      !current_user.profile.trainings.nil? && current_user.profile.trainings.size>0
    end
  end


end
