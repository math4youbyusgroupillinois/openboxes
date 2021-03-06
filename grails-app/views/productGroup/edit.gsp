
<%@ page import="org.pih.warehouse.product.ProductGroup"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="custom" />
<g:set var="entityName"
	value="${warehouse.message(code: 'productGroup.label', default: 'ProductGroup')}" />
<title><warehouse:message code="default.edit.label"
		args="[entityName]" /></title>
<!-- Specify content to overload like global navigation links, page titles, etc. -->
<content tag="pageTitle"> <warehouse:message
	code="default.edit.label" args="[entityName]" /></content>

</head>
<body>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${productGroupInstance}">
			<div class="errors">
				<g:renderErrors bean="${productGroupInstance}" as="list" />
			</div>
		</g:hasErrors>

        <div class="summary">
            <h1>${productGroupInstance.category.name} &rsaquo; ${productGroupInstance.description}</h1>

        </div>


		<div class="buttonBar">            	
            <g:link class="button icon log" action="list"><warehouse:message code="default.list.label" args="[warehouse.message(code:'productGroup.label').toLowerCase()]"/></g:link>
            <g:link class="button icon add" action="create"><warehouse:message code="default.add.label" args="[warehouse.message(code:'productGroup.label').toLowerCase()]"/></g:link>
		</div>
            <g:form method="post" action="update">
				<g:hiddenField name="id" value="${productGroupInstance?.id}" />
				<g:hiddenField name="version" value="${productGroupInstance?.version}" />
				<div class="box">
                    <h2><warehouse:message code="productGroup.label" default="Product group"/></h2>
					<table>
						<tbody>
							<tr class="prop">
								<td valign="top" class="name"><label for="description"><warehouse:message
											code="productGroup.description.label" default="Description" /></label>
								</td>
								<td valign="top"
									class="value ${hasErrors(bean: productGroupInstance, field: 'description', 'errors')}">
									<g:textField name="description" class="text"
										value="${productGroupInstance?.description}" size="60" />
								</td>
							</tr>


							<tr class="prop">
								<td valign="top" class="name"><label for="category.id"><warehouse:message
											code="productGroup.category.label" default="Category" /></label></td>
								<td valign="top" class="value">
                                    <g:selectCategory name="category.id" class="chzn-select-deselect" noSelection="['null':'']"
                                                      value="${productGroupInstance?.category?.id}" />

								</td>									
							</tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateCreated"><warehouse:message code="productGroup.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productGroupInstance, field: 'dateCreated', 'errors')}">
                                   <div id="dateCreated">${productGroupInstance?.dateCreated}</div>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastUpdated"><warehouse:message code="productGroup.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productGroupInstance, field: 'lastUpdated', 'errors')}">
                                    <div id="lastUpdated">${productGroupInstance?.lastUpdated}</div>
                                </td>
                            </tr>
							<tr class="prop">
								<td valign="top" colspan="2">
									<div class="buttons">
										<g:actionSubmit class="button icon approve" action="update"
											value="${warehouse.message(code: 'default.button.update.label', default: 'Update')}" />
										<g:actionSubmit class="button icon delete" action="delete"
											value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}"
											onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
            </g:form>
            <div class="box">
                <h2><warehouse:message code="productGroup.products.label" default="Products"/></h2>
                <g:render template="products" model="[productGroup: productGroupInstance, products:productGroupInstance?.products]"/>
            </div>

                <%--
                <g:selectProducts
                        id="products"
                        name="product.id"
                        category="${productGroupInstance?.category }"
                        value="${productGroupInstance?.products }"/>
                --%>


	</div>
<script>
	$(document).ready(function() {			
		$("#category").change(function() {
		    $(this).closest("form").submit();
		});
	});		
</script>	
	
</body>
</html>
