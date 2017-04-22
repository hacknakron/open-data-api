class Parcel < ApplicationRecord
  validates :object_id, presence: true
  validates :parcel_id, presence: true

  belongs_to :land_use_code

  has_many :parcel_sales
  has_many :parcel_appraisals

end

# OBJECTID			2364222		
# *PARID				5619132	
# *TAXYR				2017	
# SEQ					0
# *ALT_ID				ST00011A8003000	
# *ADRNO				None	
# *ADRDIR				None	
# *ADRSTR				SPRINGDALE	
# *ADRSUF				DR	
# *ADRSUF2				None					
# *ADDR				SPRINGDALE DR	
# *ZIP					44224
# NBHD				30700001	
# CLASS				R	
# *LUC					500
# ACRES				None
# *CALCARES			1.0393	
# *MAIL1				1040 SPRINGDALE LLC
# *MAIL2				None
# *OWN1				1040 SPRINGDALE LLC
# *OWN2				None
# *OWNADDR1			3057 MIWOK WAY	
# *OWNADDR2			None	
# *OWNADDR3			None					
# *OWNZIP1				94517				
# *OWNZIP2				None				
# *CITYNAME			CLAYTON					
# *STATECODE			CA					
# COUNTRY				None				
# NOTECD1				49				
# NOTECD2				None				
# *DESCRIPTION			LOT 52 S OF SPRINGDALE RD 1.0393 AC					
# PARDATNUM			58362					
# USER8				None				
# USER9				None				
# ISRENTAL			None