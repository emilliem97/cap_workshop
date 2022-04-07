using CatalogService from './cat-service';

annotate CatalogService.Books with @odata.draft.enabled;


annotate CatalogService.Books with @(UI : {
    HeaderInfo       : {
        TypeName       : 'Book',
        TypeNamePlural : 'Books',
        Title          : {
            $Type : 'UI.DataField',
            Value : title
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : ID
        }
    },
    SelectionFields  : [
        ID,
        author_name,
        title
    ],
    LineItem         : [
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.debug',
            Label  : 'Debug',
            Visible,
            Enabled
        },
        {
            Value : ID,
            Label : 'ID'
        },
        {
            Value : author_name,
            Label : 'Author name'
        },
        {
            Value : title,
            Label : 'Title'
        },
        {
            Value : stock,
            Label : 'Stock'
        },
        {
            Value : price,
            Label : 'Price'
        },
        {
            Value : created_by,
            Label : 'Price'
        }
    ],
    Facets           : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Book details',
        Target : '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main : {Data : [
        {
            Value : ID,
            Label : 'ID'
        },
        {
            Value : author_name,
            Label : 'Author name'
        },
        {
            Value : title,
            Label : 'Title'
        },
        {
            Value : stock,
            Label : 'Stock'
        },
        {
            Value : price,
            Label : 'Price'
        }
    ]}
}, ) {

};


annotate CatalogService.Books actions {
    @(
        Common.SideEffects              : {TargetEntities : [_it, ]},
        cds.odata.bindingparameter.name : '_it',
        Core.OperationAvailable         : _it.allowButton,
        UI.FieldGroup
    )
    yourAction(email @title : 'Email'  @FieldControl.Mandatory,
    position         @title : 'Position'
    // something else
    );

}
