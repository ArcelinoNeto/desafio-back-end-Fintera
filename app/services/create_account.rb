class CreateAccount < ApplicationService
  def initialize(payload, from_fintera: false)
    @payload = payload
    @from_fintera = from_fintera
    @errors = []
  end

  def call
    if account_valid?
      account = Account.new(account_params)
      if account.save && User.create(users_params(account))
        Result.new(true, account)
      else
        @errors << account.errors.full_messages
        Result.new(false, nil, @errors.join(","))
      end
    else
      @errors << "Account is not valid"
      Result.new(false, nil, @errors.join(","))
    end
  end

  def account_valid?
    return false if @payload.blank?

    true
  end

  def account_params
    if @from_fintera
      { name: @payload[:name],
        active: true, }
    else
      {
        name: @payload[:name],
        active: false,
      }
    end
  end

  def users_params(account)
    @payload[:users].map do |user|
      { first_name: user[:first_name],
        last_name: user[:last_name],
        email: user[:email],
        phone: user[:phone].to_s.gsub(/\D/, ""),
        created_at: Time.zone.now,
        updated_at: Time.zone.now, }
    end
  end
end
