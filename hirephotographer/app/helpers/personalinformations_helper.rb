module PersonalinformationsHelper

  def getPersonalinformation(idv)
    id = idv
    User.find(id)
  end
end
