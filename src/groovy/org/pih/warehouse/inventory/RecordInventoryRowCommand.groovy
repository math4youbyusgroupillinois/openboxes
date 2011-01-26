package org.pih.warehouse.inventory

import org.codehaus.groovy.grails.validation.Validateable;

@Validateable
class RecordInventoryRowCommand {
	Integer id
	String lotNumber
	Date expirationDate
	String description;
	Integer oldQuantity;
	Integer newQuantity;
	
	static constraints = {
		id(nullable:true)
		expirationDate(nullable:true)
		lotNumber(nullable:true)
		description(nullable:true)
		oldQuantity(nullable:false, min: 0)
		newQuantity(nullable:false, min: 0)
	}
	
}