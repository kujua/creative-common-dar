defmodule DARState do
  @idle :idle
  @requestreceived :requestreceived
  @requestvalidated :requestvalidated
  @retrievingdata :retrievingdata
  @dataretrieved :dataretrieved
  @processingimage :processingimage
  @imageprocessed :imageprocessed
  @creatingdocument :creatingdocument
  @documentcreated :documentcreated
  @validateresponse :validateresponse
  @requestprocessed :requestprocessed

  def idle do
    @idle
  end

  def requestreceived do
    @requestreceived
  end

  def requestvalidated do
    @requestvalidated
  end

  def retrievingdata do
    @retrievingdata
  end

  def dataretrieved do
    @dataretrieved
  end

  def processingimage do
    @processingimage
  end

  def imageprocessed do
    @imageprocessed
  end

  def creatingdocument do
    @creatingdocument
  end

  def documentcreated do
    @documentcreated
  end

  def validateresponse do
    @validateresponse
  end

  def requestprocessed do
    @requestprocessed
  end
end
