<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="0" simplifyAlgorithm="0" version="3.4.6-Madeira" hasScaleBasedVisibilityFlag="0" maxScale="0" simplifyDrawingHints="1" simplifyMaxScale="1" minScale="1e+8" styleCategories="AllStyleCategories" simplifyDrawingTol="1" simplifyLocal="1" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="singleSymbol" enableorderby="0" forceraster="0" symbollevels="0">
    <symbols>
      <symbol type="fill" force_rhr="0" name="0" clip_to_extent="1" alpha="1">
        <layer enabled="1" locked="0" pass="0" class="SimpleFill">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="125,139,143,0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="227,26,28,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="solid"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
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
      <value>"alert_id"</value>
    </property>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory backgroundAlpha="255" sizeType="MM" minScaleDenominator="0" lineSizeScale="3x:0,0,0,0,0,0" height="15" width="15" maxScaleDenominator="1e+8" minimumSize="0" penWidth="0" penAlpha="255" scaleDependency="Area" backgroundColor="#ffffff" opacity="1" sizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" rotationOffset="270" penColor="#000000" barWidth="5" enabled="0" diagramOrientation="Up" labelPlacementMethod="XHeight" lineSizeType="MM">
      <fontProperties description="Noto Sans,10,-1,0,50,0,0,0,0,0,Regular" style="Regular"/>
      <attribute field="" label="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings obstacle="0" priority="0" showAll="1" placement="1" dist="0" zIndex="0" linePlacementFlags="18">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="alert_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="validation_date">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="before_image_date">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="after_image_date">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="geom_area_ha">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="alert_id" name="" index="0"/>
    <alias field="validation_date" name="" index="1"/>
    <alias field="before_image_date" name="" index="2"/>
    <alias field="after_image_date" name="" index="3"/>
    <alias field="geom_area_ha" name="" index="4"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="alert_id" expression=""/>
    <default applyOnUpdate="0" field="validation_date" expression=""/>
    <default applyOnUpdate="0" field="before_image_date" expression=""/>
    <default applyOnUpdate="0" field="after_image_date" expression=""/>
    <default applyOnUpdate="0" field="geom_area_ha" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="0" field="alert_id" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="validation_date" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="before_image_date" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="after_image_date" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="geom_area_ha" constraints="0" unique_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="alert_id" exp="" desc=""/>
    <constraint field="validation_date" exp="" desc=""/>
    <constraint field="before_image_date" exp="" desc=""/>
    <constraint field="after_image_date" exp="" desc=""/>
    <constraint field="geom_area_ha" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting id="{2eb0cbe6-4412-4f55-9e3b-04b584889c1d}" type="1" shortTitle="Highlight" action="from qgis import utils as QgsUtils&#xa;&#xa;def getFunctionActionsForm(pluginName):&#xa;    &quot;&quot;&quot;&#xa;    Function from Plugin for actions Form&#xa;&#xa;    :param pluginName: Name of plugin&#xa;    &quot;&quot;&quot;&#xa;    getInstanceInPlugin = lambda plugin: plugin.alertMB # _init_.py: initGui()&#xa;    getActionsForm = lambda plugin: plugin.alertMB.mb.actionsForm # class_instance.py: _init_()&#xa;    plugins = {}&#xa;    for name, obj in QgsUtils.plugins.items():&#xa;        plugins[ name ] = obj&#xa;    if not pluginName in plugins:&#xa;        return { 'isOk': False, 'message': &quot;Missing {name} Plugin.&quot;.format(name=pluginName) }&#xa;    if getInstanceInPlugin( plugins[ pluginName ] ) is None:&#xa;        return { 'isOk': False, 'message': &quot;Run the {name} Plugin.&quot;.format(name=pluginName) }&#xa;    return { 'isOk': True, 'function': getActionsForm( plugins[ pluginName ] ) }&#xa;&#xa;nameAction = 'highlight'&#xa;title = &quot;Action MapBiomas&quot;&#xa;msgBar =  QgsUtils.iface.messageBar()&#xa;r = getFunctionActionsForm('alertmb')&#xa;if r['isOk']:&#xa;    actionsForm = r['function']&#xa;    r = actionsForm( nameAction, [% $id %] )&#xa;    if not r['isOk']:&#xa;        msgBar.pushCritical( title, r['message'] )&#xa;else:&#xa;    msgBar.pushCritical( title, r['message'] )&#xa;" isEnabledOnlyWhenEditable="0" name="Highlight" notificationMessage="" capture="0" icon="">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting id="{bf3f989f-0346-4352-8a99-b6b4bef92c65}" type="1" shortTitle="Zoom" action="from qgis import utils as QgsUtils&#xa;&#xa;def getFunctionActionsForm(pluginName):&#xa;    &quot;&quot;&quot;&#xa;    Function from Plugin for actions Form&#xa;&#xa;    :param pluginName: Name of plugin&#xa;    &quot;&quot;&quot;&#xa;    getInstanceInPlugin = lambda plugin: plugin.alertMB # _init_.py: initGui()&#xa;    getActionsForm = lambda plugin: plugin.alertMB.mb.actionsForm # class_instance.py: _init_()&#xa;    plugins = {}&#xa;    for name, obj in QgsUtils.plugins.items():&#xa;        plugins[ name ] = obj&#xa;    if not pluginName in plugins:&#xa;        return { 'isOk': False, 'message': &quot;Missing {name} Plugin.&quot;.format(name=pluginName) }&#xa;    if getInstanceInPlugin( plugins[ pluginName ] ) is None:&#xa;        return { 'isOk': False, 'message': &quot;Run the {name} Plugin.&quot;.format(name=pluginName) }&#xa;    return { 'isOk': True, 'function': getActionsForm( plugins[ pluginName ] ) }&#xa;&#xa;nameAction = 'zoom'&#xa;title = &quot;Action MapBiomas&quot;&#xa;msgBar =  QgsUtils.iface.messageBar()&#xa;r = getFunctionActionsForm('alertmb')&#xa;if r['isOk']:&#xa;    actionsForm = r['function']&#xa;    r = actionsForm( nameAction, [% $id %] )&#xa;    if not r['isOk']:&#xa;        msgBar.pushCritical( title, r['message'] )&#xa;else:&#xa;    msgBar.pushCritical( title, r['message'] )&#xa;" isEnabledOnlyWhenEditable="0" name="Zoom" notificationMessage="" capture="0" icon="">
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column type="actions" width="-1" hidden="1"/>
      <column type="field" name="alert_id" width="-1" hidden="0"/>
      <column type="field" name="validation_date" width="-1" hidden="0"/>
      <column type="field" name="before_image_date" width="-1" hidden="0"/>
      <column type="field" name="after_image_date" width="-1" hidden="0"/>
      <column type="field" name="geom_area_ha" width="-1" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">/home/lmotta/.local/share/QGIS/QGIS3/profiles/default/python/plugins/alertmb/form.ui</editform>
  <editforminit>loadForm</editforminit>
  <editforminitcodesource>1</editforminitcodesource>
  <editforminitfilepath>/home/lmotta/.local/share/QGIS/QGIS3/profiles/default/python/plugins/alertmb/form.py</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <editable/>
  <labelOnTop/>
  <widgets/>
  <previewExpression>alert_id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
