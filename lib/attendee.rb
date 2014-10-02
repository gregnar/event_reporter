class Attendee

  def initialize(hash)
    @last_name = hash[:last_name]
    @first_name = hash[:first_name]
    @email = hash[:email_address]
    @zipcode = hash[:zipcode]
    @city = hash[:city]
    @state = hash[:state]
    @address = hash[:street]
    @phone = hash[:phone]
  end

  def last_name
    @last_name
  end

  def first_name
    @first_name
  end

  def email
    @email
  end

  def zipcode
    @zipcode
  end

  def city
    @city
  end

  def state
    @state
  end

  def address
    @address
  end

  def phone
    @phone
  end
end
