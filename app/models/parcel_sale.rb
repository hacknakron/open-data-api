class ParcelSale < ApplicationRecord
  validates :object_id, presence: true
  validates :parcel_id, presence: true
  validates :sales_date, presence: true
  validates :price, numericality: { only_integer: true }, allow_nil: true
  validates :approximate_total, numericality: { only_integer: true }, allow_nil: true

  belongs_to :parcel
end

# OBJECTID			6454797
# JUR				000
# PARID				0105565
# SALESDT			01-17-1995
# PRICE				215000.0
# SEQ				0
# SALEKEY			2577
# CHURCH			Y
# STATUS			None
# TRANSNO			None
# TRANSDT			01-17-1995
# OLDYR				0
# OLDSEQ			0
# NEWYR				0
# NEWSEQ			0
# BOOK				None
# PAGE				None
# OLDOWN			JOHNSON METHODIST CHURCH OF BARB
# OWN1				CORNERSTONE CHURCH
# SOURCE			1
# SALETYPE			2
# SALEVAL			1
# MKTVALID			Y
# NOTE1				None
# NOTE2				None
# STEB				None
# ASMT				None
# STFLAG			None
# NOPAR				4
# INSTRUNO			None
# INSTRTYP			None
# IMAGENO			None
# ADJPRICE			None
# ADJREAS			None
# RECORDDT			None
# APRTOT			None
# USER1				None
# USER2				None
# USER3				None
# USER4				None