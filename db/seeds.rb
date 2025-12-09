# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clear existing fiqh_tools
FiqhTool.destroy_all

# Category 1: Core Fiqh/Ijtihād Tools (The "Big Five")
core_category = FiqhTool.create!(
  title: "🔷 Core Fiqh/Ijtihād Tools (The \"Big Five\")",
  description: "These are the main rational tools recognized in classical uṣūl.",
  position: 1
)

qiyas = FiqhTool.create!(
  title: "1️⃣ Qiyās (Analogy)",
  description: "Extending a ruling from a known case to a new case using a shared ʿillah.",
  position: 1,
  fiqh_tool_id: core_category.id
)

istihsan = FiqhTool.create!(
  title: "2️⃣ Istihsān (Equitable Juristic Preference)",
  description: "Used mainly by Hanafis. When strict qiyās leads to hardship or conflicts with a stronger principle, they \"prefer\" an alternative ruling.",
  position: 2,
  fiqh_tool_id: core_category.id
)

istislah = FiqhTool.create!(
  title: "3️⃣ Istislāḥ / Maslaḥah Mursalah (Public Interest Reasoning)",
  description: "Used strongly by Mālikīs. Deriving a rule solely based on maslaḥah (benefit) when no text or qiyās covers the case. Examples: traffic laws, passport system, vaccines, etc.",
  position: 3,
  fiqh_tool_id: core_category.id
)

sadd_dharai = FiqhTool.create!(
  title: "4️⃣ Sadd adh-Dharā'iʿ (Blocking the Means)",
  description: "Used strongly by Mālikīs and Hanbalis. If something is a means that leads to a haram outcome, the means can also become forbidden. Example: selling grapes to a winery → blocked because it clearly leads to wine production.",
  position: 4,
  fiqh_tool_id: core_category.id
)

urf = FiqhTool.create!(
  title: "5️⃣ ʿUrf (Custom / Social Convention)",
  description: "If not contradicting Qur'an or Sunnah, custom becomes a legal determinant. Strong in Ḥanafī and Mālikī fiqh. Contracts, dowry amounts, clothing norms, business practices — all often come from ʿurf.",
  position: 5,
  fiqh_tool_id: core_category.id
)

# Category 2: Secondary Ijtihād Tools
secondary_category = FiqhTool.create!(
  title: "🔷 Secondary Ijtihād Tools",
  description: "Additional tools used in ijtihād and legal reasoning.",
  position: 2
)

istishab = FiqhTool.create!(
  title: "6️⃣ Istishāb (Presumption of Continuity)",
  description: "Assume the last known state remains until proven otherwise. Examples: Assume purity until impurity is proven. Assume ownership stays with the owner until transfer is proven.",
  position: 1,
  fiqh_tool_id: secondary_category.id
)

shar_man_qablana = FiqhTool.create!(
  title: "7️⃣ Sharʿ man Qablanā (Laws of previous prophets)",
  description: "If confirmed in our scripture and not abrogated, it may be used (significant debate among madhāhib).",
  position: 2,
  fiqh_tool_id: secondary_category.id
)

qawl_sahabah = FiqhTool.create!(
  title: "8️⃣ Qawl aṣ-Ṣaḥābah (Companion's Opinion)",
  description: "If a Companion gave a ruling without contradiction, many madhhabs treat it as quasi-binding.",
  position: 3,
  fiqh_tool_id: secondary_category.id
)

istiṣhab_hali = FiqhTool.create!(
  title: "9️⃣ Istiṣḥāb al-Ḥāli / Bara'at al-Dhimmah (Presumption of Innocence / Non-liability)",
  description: "Everyone is innocent or free of obligation unless a burden is established.",
  position: 4,
  fiqh_tool_id: secondary_category.id
)

# Category 3: Linguistic & Textual Tools in Fiqh
linguistic_category = FiqhTool.create!(
  title: "🔷 Linguistic & Textual Tools in Fiqh",
  description: "These are also fiqh tools, but they operate inside the interpretation of Qur'an & Sunnah.",
  position: 3
)

amm_khass = FiqhTool.create!(
  title: "🔟 ʿAmm & Khāṣṣ (General vs. Specific Texts)",
  description: "Distinguishing between general and specific textual applications.",
  position: 1,
  fiqh_tool_id: linguistic_category.id
)

mutlaq_muqayyad = FiqhTool.create!(
  title: "1️⃣1️⃣ Mutlaq & Muqayyad (Unrestricted vs. Restricted)",
  description: "Understanding unrestricted and restricted textual meanings.",
  position: 2,
  fiqh_tool_id: linguistic_category.id
)

mujmal_mubayyan = FiqhTool.create!(
  title: "1️⃣2️⃣ Mujmal & Mubayyan (Ambiguous vs. Clarified)",
  description: "Distinguishing between ambiguous and clarified texts.",
  position: 3,
  fiqh_tool_id: linguistic_category.id
)

mafhum_muwafaqah = FiqhTool.create!(
  title: "1️⃣3️⃣ Mafhūm al-Muwāfaqah (Implicit meaning – a fortiori reasoning)",
  description: "\"Do not say 'uff' to parents\" → implies don't hit them either.",
  position: 4,
  fiqh_tool_id: linguistic_category.id
)

mafhum_mukhalafah = FiqhTool.create!(
  title: "1️⃣4️⃣ Mafhūm al-Mukhālafah (Argument from contrast)",
  description: "If A is mentioned with a condition, then without the condition the ruling differs.",
  position: 5,
  fiqh_tool_id: linguistic_category.id
)

dalalah_iqtidha = FiqhTool.create!(
  title: "1️⃣5️⃣ Dalālah al-Iqtidhā' (Necessary Implication)",
  description: "The text implies a missing but required meaning (e.g., \"freeing a slave\" implies ownership).",
  position: 6,
  fiqh_tool_id: linguistic_category.id
)

# Category 4: Tools that Override or Outweigh Other Proofs
override_category = FiqhTool.create!(
  title: "🔷 Tools that Override or Outweigh Other Proofs",
  description: "Tools that can override or outweigh other legal proofs.",
  position: 4
)

maqasid_shariah = FiqhTool.create!(
  title: "1️⃣6️⃣ Maqāṣid ash-Sharīʿah (Objectives of the Law)",
  description: "Used heavily by modern jurists and Mālikīs. Protect: religion, life, intellect, lineage, wealth, dignity.",
  position: 1,
  fiqh_tool_id: override_category.id
)

dharurah = FiqhTool.create!(
  title: "1️⃣7️⃣ Dharūrah (Necessity)",
  description: "Necessity permits the prohibited.",
  position: 2,
  fiqh_tool_id: override_category.id
)

hajah = FiqhTool.create!(
  title: "1️⃣8️⃣ Ḥājah (Public or Private Need)",
  description: "Need has the status of necessity in many rulings.",
  position: 3,
  fiqh_tool_id: override_category.id
)

puts "Created #{FiqhTool.count} fiqh tools"
