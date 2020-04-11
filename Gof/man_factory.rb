class ManFactory

  def self.create
    Context.new(
      ManStrategy.new
    )
  end
end