defmodule Mailman.TestingAdapter do

  def deliver(_, _email, message) do
    { :ok, message }
  end

end
