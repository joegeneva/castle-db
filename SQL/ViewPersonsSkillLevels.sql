select person.Name, skill.Name, skillLev.Level 
	FROM castle.skill_level as skillLev 
	inner join castle.person as person
	inner join castle.skill as skill 
    on skillLev.Person = person.idPerson and skillLev.Skill = skill.idSkill