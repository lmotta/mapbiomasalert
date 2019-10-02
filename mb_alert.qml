<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="0" simplifyDrawingTol="1" maxScale="0" readOnly="0" version="3.4.12-Madeira" simplifyLocal="1" simplifyDrawingHints="1" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" styleCategories="AllStyleCategories" minScale="1e+8" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" type="singleSymbol" symbollevels="0" forceraster="0">
    <symbols>
      <symbol name="0" type="fill" clip_to_extent="1" alpha="1" force_rhr="0">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="125,139,143,0" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>alerta_id</value>
    </property>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory minScaleDenominator="0" scaleDependency="Area" penColor="#000000" enabled="0" barWidth="5" backgroundColor="#ffffff" backgroundAlpha="255" diagramOrientation="Up" minimumSize="0" sizeType="MM" scaleBasedVisibility="0" lineSizeScale="3x:0,0,0,0,0,0" lineSizeType="MM" penAlpha="255" height="15" opacity="1" penWidth="0" maxScaleDenominator="1e+8" labelPlacementMethod="XHeight" rotationOffset="270" width="15" sizeScale="3x:0,0,0,0,0,0">
      <fontProperties style="Regular" description="Noto Sans,10,-1,0,50,0,0,0,0,0,Regular"/>
      <attribute color="#000000" field="" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" priority="0" placement="1" linePlacementFlags="18" zIndex="0" obstacle="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="alerta_id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dt_validacao">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fontes">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dt_antes">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="img_antes">
      <editWidget type="ExternalResource">
        <config>
          <Option type="Map">
            <Option name="DocumentViewer" type="int" value="2"/>
            <Option name="DocumentViewerHeight" type="int" value="0"/>
            <Option name="DocumentViewerWidth" type="int" value="0"/>
            <Option name="FileWidget" type="bool" value="false"/>
            <Option name="FileWidgetButton" type="bool" value="true"/>
            <Option name="FileWidgetFilter" type="QString" value=""/>
            <Option name="PropertyCollection" type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
            <Option name="RelativeStorage" type="int" value="0"/>
            <Option name="StorageMode" type="int" value="0"/>
            <Option name="UseLink" type="bool" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dt_depois">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="img_depois">
      <editWidget type="ExternalResource">
        <config>
          <Option type="Map">
            <Option name="DocumentViewer" type="int" value="2"/>
            <Option name="DocumentViewerHeight" type="int" value="0"/>
            <Option name="DocumentViewerWidth" type="int" value="0"/>
            <Option name="FileWidget" type="bool" value="false"/>
            <Option name="FileWidgetButton" type="bool" value="true"/>
            <Option name="FileWidgetFilter" type="QString" value=""/>
            <Option name="PropertyCollection" type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
            <Option name="RelativeStorage" type="int" value="0"/>
            <Option name="StorageMode" type="int" value="0"/>
            <Option name="UseLink" type="bool" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cars_ids">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="true"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cars_qtd">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="area_ha">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="alerta_id"/>
    <alias index="1" name="" field="dt_validacao"/>
    <alias index="2" name="" field="fontes"/>
    <alias index="3" name="" field="dt_antes"/>
    <alias index="4" name="" field="img_antes"/>
    <alias index="5" name="" field="dt_depois"/>
    <alias index="6" name="" field="img_depois"/>
    <alias index="7" name="" field="cars_ids"/>
    <alias index="8" name="" field="cars_qtd"/>
    <alias index="9" name="" field="area_ha"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="alerta_id" expression="" applyOnUpdate="0"/>
    <default field="dt_validacao" expression="" applyOnUpdate="0"/>
    <default field="fontes" expression="" applyOnUpdate="0"/>
    <default field="dt_antes" expression="" applyOnUpdate="0"/>
    <default field="img_antes" expression="" applyOnUpdate="0"/>
    <default field="dt_depois" expression="" applyOnUpdate="0"/>
    <default field="img_depois" expression="" applyOnUpdate="0"/>
    <default field="cars_ids" expression="" applyOnUpdate="0"/>
    <default field="cars_qtd" expression="" applyOnUpdate="0"/>
    <default field="area_ha" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint constraints="2" exp_strength="0" unique_strength="2" field="alerta_id" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" unique_strength="0" field="dt_validacao" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" unique_strength="0" field="fontes" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" unique_strength="0" field="dt_antes" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" unique_strength="0" field="img_antes" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" unique_strength="0" field="dt_depois" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" unique_strength="0" field="img_depois" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" unique_strength="0" field="cars_ids" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" unique_strength="0" field="cars_qtd" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" unique_strength="0" field="area_ha" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="alerta_id"/>
    <constraint exp="" desc="" field="dt_validacao"/>
    <constraint exp="" desc="" field="fontes"/>
    <constraint exp="" desc="" field="dt_antes"/>
    <constraint exp="" desc="" field="img_antes"/>
    <constraint exp="" desc="" field="dt_depois"/>
    <constraint exp="" desc="" field="img_depois"/>
    <constraint exp="" desc="" field="cars_ids"/>
    <constraint exp="" desc="" field="cars_qtd"/>
    <constraint exp="" desc="" field="area_ha"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting name="Highlight" icon="" type="1" notificationMessage="" isEnabledOnlyWhenEditable="0" id="{fc521d69-1534-422e-b1c8-8c13f74432aa}" capture="0" action="from qgis import utils as QgsUtils&#xa;&#xa;def getFunctionActionsForm(pluginName):&#xa;    &quot;&quot;&quot;&#xa;    Function from Plugin for actions Form&#xa;&#xa;    :param pluginName: Name of plugin&#xa;    &quot;&quot;&quot;&#xa;    getInstanceInPlugin = lambda plugin: plugin.alertMB # _init_.py: initGui()&#xa;    getActionsForm = lambda plugin: plugin.alertMB.mb.actionsForm # class_instance.py: _init_()&#xa;    plugins = {}&#xa;    for name, obj in QgsUtils.plugins.items():&#xa;        plugins[ name ] = obj&#xa;    if not pluginName in plugins:&#xa;        return { 'isOk': False, 'message': &quot;Missing {name} Plugin.&quot;.format(name=pluginName) }&#xa;    if getInstanceInPlugin( plugins[ pluginName ] ) is None:&#xa;        return { 'isOk': False, 'message': &quot;Run the {name} Plugin.&quot;.format(name=pluginName) }&#xa;    return { 'isOk': True, 'function': getActionsForm( plugins[ pluginName ] ) }&#xa;&#xa;nameAction = 'highlight'&#xa;title = &quot;Action MapBiomas&quot;&#xa;msgBar =  QgsUtils.iface.messageBar()&#xa;r = getFunctionActionsForm('alertmb')&#xa;if r['isOk']:&#xa;    actionsForm = r['function']&#xa;    r = actionsForm( nameAction, [% $id %] )&#xa;    if not r['isOk']:&#xa;        msgBar.pushCritical( title, r['message'] )&#xa;else:&#xa;    msgBar.pushCritical( title, r['message'] )&#xa;" shortTitle="Highlight">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting name="Zoom" icon="" type="1" notificationMessage="" isEnabledOnlyWhenEditable="0" id="{2f81ebcb-c4fe-4946-8112-efe58651cf9a}" capture="0" action="from qgis import utils as QgsUtils&#xa;&#xa;def getFunctionActionsForm(pluginName):&#xa;    &quot;&quot;&quot;&#xa;    Function from Plugin for actions Form&#xa;&#xa;    :param pluginName: Name of plugin&#xa;    &quot;&quot;&quot;&#xa;    getInstanceInPlugin = lambda plugin: plugin.alertMB # _init_.py: initGui()&#xa;    getActionsForm = lambda plugin: plugin.alertMB.mb.actionsForm # class_instance.py: _init_()&#xa;    plugins = {}&#xa;    for name, obj in QgsUtils.plugins.items():&#xa;        plugins[ name ] = obj&#xa;    if not pluginName in plugins:&#xa;        return { 'isOk': False, 'message': &quot;Missing {name} Plugin.&quot;.format(name=pluginName) }&#xa;    if getInstanceInPlugin( plugins[ pluginName ] ) is None:&#xa;        return { 'isOk': False, 'message': &quot;Run the {name} Plugin.&quot;.format(name=pluginName) }&#xa;    return { 'isOk': True, 'function': getActionsForm( plugins[ pluginName ] ) }&#xa;&#xa;nameAction = 'zoom'&#xa;title = &quot;Action MapBiomas&quot;&#xa;msgBar =  QgsUtils.iface.messageBar()&#xa;r = getFunctionActionsForm('alertmb')&#xa;if r['isOk']:&#xa;    actionsForm = r['function']&#xa;    r = actionsForm( nameAction, [% $id %] )&#xa;    if not r['isOk']:&#xa;        msgBar.pushCritical( title, r['message'] )&#xa;else:&#xa;    msgBar.pushCritical( title, r['message'] )&#xa;" shortTitle="Zoom">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting name="Report" icon="" type="1" notificationMessage="" isEnabledOnlyWhenEditable="0" id="{29b6cfcf-8cd5-419f-bfda-a16fb5ae82c3}" capture="0" action="from qgis import utils as QgsUtils&#xa;&#xa;def getFunctionActionsForm(pluginName):&#xa;    &quot;&quot;&quot;&#xa;    Function from Plugin for actions Form&#xa;&#xa;    :param pluginName: Name of plugin&#xa;    &quot;&quot;&quot;&#xa;    getInstanceInPlugin = lambda plugin: plugin.alertMB # _init_.py: initGui()&#xa;    getActionsForm = lambda plugin: plugin.alertMB.mb.actionsForm # class_instance.py: _init_()&#xa;    plugins = {}&#xa;    for name, obj in QgsUtils.plugins.items():&#xa;        plugins[ name ] = obj&#xa;    if not pluginName in plugins:&#xa;        return { 'isOk': False, 'message': &quot;Missing {name} Plugin.&quot;.format(name=pluginName) }&#xa;    if getInstanceInPlugin( plugins[ pluginName ] ) is None:&#xa;        return { 'isOk': False, 'message': &quot;Run the {name} Plugin.&quot;.format(name=pluginName) }&#xa;    return { 'isOk': True, 'function': getActionsForm( plugins[ pluginName ] ) }&#xa;&#xa;nameAction = 'report'&#xa;title = &quot;Action MapBiomas&quot;&#xa;msgBar =  QgsUtils.iface.messageBar()&#xa;r = getFunctionActionsForm('alertmb')&#xa;if r['isOk']:&#xa;    actionsForm = r['function']&#xa;    r = actionsForm( nameAction, [% $id %] )&#xa;    if not r['isOk']:&#xa;        msgBar.pushCritical( title, r['message'] )&#xa;else:&#xa;    msgBar.pushCritical( title, r['message'] )&#xa;" shortTitle="Report">
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column type="actions" width="-1" hidden="1"/>
      <column name="alerta_id" type="field" width="-1" hidden="0"/>
      <column name="fontes" type="field" width="-1" hidden="0"/>
      <column name="dt_antes" type="field" width="-1" hidden="0"/>
      <column name="img_antes" type="field" width="-1" hidden="0"/>
      <column name="dt_depois" type="field" width="-1" hidden="0"/>
      <column name="img_depois" type="field" width="262" hidden="0"/>
      <column name="area_ha" type="field" width="-1" hidden="0"/>
      <column name="dt_validacao" type="field" width="-1" hidden="0"/>
      <column name="cars_ids" type="field" width="-1" hidden="0"/>
      <column name="cars_qtd" type="field" width="-1" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">/home/lmotta/.local/share/QGIS/QGIS3/profiles/default/python/plugins/alertmb/form.ui</editform>
  <editforminit/>
  <editforminitcodesource>2</editforminitcodesource>
  <editforminitfilepath>/home/lmotta/.local/share/QGIS/QGIS3/profiles/default/python/plugins/alertmb/form.py</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- código: utf-8 -*-
"""
Formas QGIS podem ter uma função Python que é chamada quando o formulário é
aberto.

Use esta função para adicionar lógica extra para seus formulários.

Digite o nome da função na "função Python Init"
campo.
Um exemplo a seguir:
"""
de qgis.PyQt.QtWidgets importar QWidget

def my_form_open(diálogo, camada, feição):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer visibilityExpression="" name="Alerta" groupBox="0" columnCount="1" visibilityExpressionEnabled="0" showLabel="1">
      <attributeEditorField index="0" name="alerta_id" showLabel="1"/>
      <attributeEditorField index="9" name="area_ha" showLabel="1"/>
      <attributeEditorField index="1" name="dt_validacao" showLabel="1"/>
      <attributeEditorField index="2" name="fontes" showLabel="1"/>
      <attributeEditorField index="7" name="cars_ids" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpression="" name="Imagens" groupBox="0" columnCount="1" visibilityExpressionEnabled="0" showLabel="1">
      <attributeEditorField index="3" name="dt_antes" showLabel="1"/>
      <attributeEditorField index="4" name="img_antes" showLabel="1"/>
      <attributeEditorField index="5" name="dt_depois" showLabel="1"/>
      <attributeEditorField index="6" name="img_depois" showLabel="1"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="alerta_id" editable="0"/>
    <field name="area_ha" editable="0"/>
    <field name="cars_ids" editable="0"/>
    <field name="cars_qtd" editable="1"/>
    <field name="dt_antes" editable="0"/>
    <field name="dt_depois" editable="0"/>
    <field name="dt_validacao" editable="0"/>
    <field name="fontes" editable="0"/>
    <field name="img_antes" editable="0"/>
    <field name="img_depois" editable="0"/>
  </editable>
  <labelOnTop>
    <field name="alerta_id" labelOnTop="0"/>
    <field name="area_ha" labelOnTop="0"/>
    <field name="cars_ids" labelOnTop="0"/>
    <field name="cars_qtd" labelOnTop="0"/>
    <field name="dt_antes" labelOnTop="0"/>
    <field name="dt_depois" labelOnTop="0"/>
    <field name="dt_validacao" labelOnTop="0"/>
    <field name="fontes" labelOnTop="0"/>
    <field name="img_antes" labelOnTop="0"/>
    <field name="img_depois" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>alerta_id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
