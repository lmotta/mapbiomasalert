<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.12-Madeira" simplifyLocal="1" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="1" simplifyAlgorithm="0" minScale="1e+8" maxScale="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories" simplifyMaxScale="1" readOnly="0" labelsEnabled="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" forceraster="0" type="singleSymbol" symbollevels="0">
    <symbols>
      <symbol alpha="1" force_rhr="0" name="0" clip_to_extent="1" type="fill">
        <layer locked="0" pass="0" enabled="1" class="SimpleFill">
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
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory sizeScale="3x:0,0,0,0,0,0" minimumSize="0" backgroundColor="#ffffff" penAlpha="255" labelPlacementMethod="XHeight" diagramOrientation="Up" minScaleDenominator="0" maxScaleDenominator="1e+8" sizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" rotationOffset="270" opacity="1" enabled="0" height="15" lineSizeType="MM" penColor="#000000" barWidth="5" width="15" scaleBasedVisibility="0" penWidth="0" scaleDependency="Area" backgroundAlpha="255">
      <fontProperties style="Regular" description="Noto Sans,10,-1,0,50,0,0,0,0,0,Regular"/>
      <attribute label="" color="#000000" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings linePlacementFlags="18" showAll="1" dist="0" zIndex="0" obstacle="0" priority="0" placement="1">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
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
              <Option name="properties" type="invalid"/>
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
              <Option name="properties" type="invalid"/>
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
    <alias name="" index="0" field="alerta_id"/>
    <alias name="" index="1" field="dt_validacao"/>
    <alias name="" index="2" field="fontes"/>
    <alias name="" index="3" field="dt_antes"/>
    <alias name="" index="4" field="img_antes"/>
    <alias name="" index="5" field="dt_depois"/>
    <alias name="" index="6" field="img_depois"/>
    <alias name="" index="7" field="cars_ids"/>
    <alias name="" index="8" field="cars_qtd"/>
    <alias name="" index="9" field="area_ha"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="alerta_id"/>
    <default applyOnUpdate="0" expression="" field="dt_validacao"/>
    <default applyOnUpdate="0" expression="" field="fontes"/>
    <default applyOnUpdate="0" expression="" field="dt_antes"/>
    <default applyOnUpdate="0" expression="" field="img_antes"/>
    <default applyOnUpdate="0" expression="" field="dt_depois"/>
    <default applyOnUpdate="0" expression="" field="img_depois"/>
    <default applyOnUpdate="0" expression="" field="cars_ids"/>
    <default applyOnUpdate="0" expression="" field="cars_qtd"/>
    <default applyOnUpdate="0" expression="" field="area_ha"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" notnull_strength="0" constraints="2" unique_strength="2" field="alerta_id"/>
    <constraint exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0" field="dt_validacao"/>
    <constraint exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0" field="fontes"/>
    <constraint exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0" field="dt_antes"/>
    <constraint exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0" field="img_antes"/>
    <constraint exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0" field="dt_depois"/>
    <constraint exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0" field="img_depois"/>
    <constraint exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0" field="cars_ids"/>
    <constraint exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0" field="cars_qtd"/>
    <constraint exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0" field="area_ha"/>
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
    <actionsetting icon="" notificationMessage="" shortTitle="Highlight" name="Highlight" id="{457c0f67-aa86-40f8-9e90-33d8e4e5ab0d}" type="1" capture="0" isEnabledOnlyWhenEditable="0" action="from qgis import utils as QgsUtils&#xa;&#xa;def getFunctionActionsForm(pluginName):&#xa;    &quot;&quot;&quot;&#xa;    Function from Plugin for actions Form&#xa;&#xa;    :param pluginName: Name of plugin&#xa;    &quot;&quot;&quot;&#xa;    getInstanceInPlugin = lambda plugin: plugin.mbalert # _init_.py: initGui()&#xa;    getActionsForm = lambda plugin: plugin.mbalert.mbr.actionsForm # class_instance.py: _init_()&#xa;    plugins = {}&#xa;    for name, obj in QgsUtils.plugins.items():&#xa;        plugins[ name ] = obj&#xa;    if not pluginName in plugins:&#xa;        return { 'isOk': False, 'message': &quot;Missing {name} Plugin.&quot;.format(name=pluginName) }&#xa;    if getInstanceInPlugin( plugins[ pluginName ] ) is None:&#xa;        return { 'isOk': False, 'message': &quot;Run the {name} Plugin.&quot;.format(name=pluginName) }&#xa;    return { 'isOk': True, 'function': getActionsForm( plugins[ pluginName ] ) }&#xa;&#xa;nameAction = 'highlight'&#xa;title = &quot;Action MapBiomas&quot;&#xa;msgBar =  QgsUtils.iface.messageBar()&#xa;r = getFunctionActionsForm('mapbiomasalert')&#xa;if r['isOk']:&#xa;    actionsForm = r['function']&#xa;    r = actionsForm( nameAction, [% $id %] )&#xa;    if not r['isOk']:&#xa;        msgBar.pushCritical( title, r['message'] )&#xa;else:&#xa;    msgBar.pushCritical( title, r['message'] )&#xa;">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting icon="" notificationMessage="" shortTitle="Zoom" name="Zoom" id="{ab27fb6d-f426-4cc4-aa2e-1c663157e3f2}" type="1" capture="0" isEnabledOnlyWhenEditable="0" action="from qgis import utils as QgsUtils&#xa;&#xa;def getFunctionActionsForm(pluginName):&#xa;    &quot;&quot;&quot;&#xa;    Function from Plugin for actions Form&#xa;&#xa;    :param pluginName: Name of plugin&#xa;    &quot;&quot;&quot;&#xa;    getInstanceInPlugin = lambda plugin: plugin.mbalert # _init_.py: initGui()&#xa;    getActionsForm = lambda plugin: plugin.mbalert.mbr.actionsForm # class_instance.py: _init_()&#xa;    plugins = {}&#xa;    for name, obj in QgsUtils.plugins.items():&#xa;        plugins[ name ] = obj&#xa;    if not pluginName in plugins:&#xa;        return { 'isOk': False, 'message': &quot;Missing {name} Plugin.&quot;.format(name=pluginName) }&#xa;    if getInstanceInPlugin( plugins[ pluginName ] ) is None:&#xa;        return { 'isOk': False, 'message': &quot;Run the {name} Plugin.&quot;.format(name=pluginName) }&#xa;    return { 'isOk': True, 'function': getActionsForm( plugins[ pluginName ] ) }&#xa;&#xa;nameAction = 'zoom'&#xa;title = &quot;Action MapBiomas&quot;&#xa;msgBar =  QgsUtils.iface.messageBar()&#xa;r = getFunctionActionsForm('mapbiomasalert')&#xa;if r['isOk']:&#xa;    actionsForm = r['function']&#xa;    r = actionsForm( nameAction, [% $id %] )&#xa;    if not r['isOk']:&#xa;        msgBar.pushCritical( title, r['message'] )&#xa;else:&#xa;    msgBar.pushCritical( title, r['message'] )&#xa;">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting icon="" notificationMessage="" shortTitle="Report" name="Report" id="{e2ebca8e-e48f-49c8-b746-d8bcd3abb477}" type="1" capture="0" isEnabledOnlyWhenEditable="0" action="from qgis import utils as QgsUtils&#xa;&#xa;def getFunctionActionsForm(pluginName):&#xa;    &quot;&quot;&quot;&#xa;    Function from Plugin for actions Form&#xa;&#xa;    :param pluginName: Name of plugin&#xa;    &quot;&quot;&quot;&#xa;    getInstanceInPlugin = lambda plugin: plugin.mbalert # _init_.py: initGui()&#xa;    getActionsForm = lambda plugin: plugin.mbalert.mbr.actionsForm # class_instance.py: _init_()&#xa;    plugins = {}&#xa;    for name, obj in QgsUtils.plugins.items():&#xa;        plugins[ name ] = obj&#xa;    if not pluginName in plugins:&#xa;        return { 'isOk': False, 'message': &quot;Missing {name} Plugin.&quot;.format(name=pluginName) }&#xa;    if getInstanceInPlugin( plugins[ pluginName ] ) is None:&#xa;        return { 'isOk': False, 'message': &quot;Run the {name} Plugin.&quot;.format(name=pluginName) }&#xa;    return { 'isOk': True, 'function': getActionsForm( plugins[ pluginName ] ) }&#xa;&#xa;nameAction = 'report'&#xa;title = &quot;Action MapBiomas&quot;&#xa;msgBar =  QgsUtils.iface.messageBar()&#xa;r = getFunctionActionsForm('mapbiomasalert')&#xa;if r['isOk']:&#xa;    actionsForm = r['function']&#xa;    r = actionsForm( nameAction, [% $id %] )&#xa;    if not r['isOk']:&#xa;        msgBar.pushCritical( title, r['message'] )&#xa;else:&#xa;    msgBar.pushCritical( title, r['message'] )&#xa;">
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" name="alerta_id" width="-1" type="field"/>
      <column hidden="0" name="fontes" width="-1" type="field"/>
      <column hidden="0" name="dt_antes" width="-1" type="field"/>
      <column hidden="0" name="img_antes" width="-1" type="field"/>
      <column hidden="0" name="dt_depois" width="-1" type="field"/>
      <column hidden="0" name="img_depois" width="262" type="field"/>
      <column hidden="0" name="area_ha" width="-1" type="field"/>
      <column hidden="0" name="dt_validacao" width="-1" type="field"/>
      <column hidden="0" name="cars_ids" width="-1" type="field"/>
      <column hidden="0" name="cars_qtd" width="-1" type="field"/>
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
    <attributeEditorContainer groupBox="0" visibilityExpression="" visibilityExpressionEnabled="0" name="Alerta" columnCount="1" showLabel="1">
      <attributeEditorField name="alerta_id" index="0" showLabel="1"/>
      <attributeEditorField name="area_ha" index="9" showLabel="1"/>
      <attributeEditorField name="dt_validacao" index="1" showLabel="1"/>
      <attributeEditorField name="fontes" index="2" showLabel="1"/>
      <attributeEditorField name="cars_ids" index="7" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer groupBox="0" visibilityExpression="" visibilityExpressionEnabled="0" name="Imagens" columnCount="1" showLabel="1">
      <attributeEditorField name="dt_antes" index="3" showLabel="1"/>
      <attributeEditorField name="img_antes" index="4" showLabel="1"/>
      <attributeEditorField name="dt_depois" index="5" showLabel="1"/>
      <attributeEditorField name="img_depois" index="6" showLabel="1"/>
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
    <field labelOnTop="0" name="alerta_id"/>
    <field labelOnTop="0" name="area_ha"/>
    <field labelOnTop="0" name="cars_ids"/>
    <field labelOnTop="0" name="cars_qtd"/>
    <field labelOnTop="0" name="dt_antes"/>
    <field labelOnTop="0" name="dt_depois"/>
    <field labelOnTop="0" name="dt_validacao"/>
    <field labelOnTop="0" name="fontes"/>
    <field labelOnTop="0" name="img_antes"/>
    <field labelOnTop="0" name="img_depois"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>alerta_id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
