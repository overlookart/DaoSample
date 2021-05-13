//
//  CollectionViewLayout.swift
//  DaoSample
//
//  Created by xzh on 2021/3/1.
//

import UIKit

// 用于为集合视图生成布局信息的抽象基类
/**
 布局对象确定单元格视图，补充视图和装饰视图在集合视图范围内的位置，并将该信息报告给集合视图。 然后，收集视图将提供的布局信息应用于相应的视图，以便可以在屏幕上显示它们
 
 必须使用UICollectionViewLayout子类才能使用它。 但是，在考虑子类化之前，请考虑是否可以使UICollectionViewCompositionalLayout适应您的布局需求
 
 
 布局对象根据布局的设计来定义项目在集合视图中的位置，大小和视觉状态。 布局的视图是由集合视图的数据源创建的
 在集合视图中布置了三种类型的视觉元素
 1.单元格是布局所定位的主要元素。 每个单元代表集合中的单个数据项。 您可以使单元格具有交互性，以便用户可以执行诸如选择，拖动和重新排序单元格之类的操作。 集合视图可以具有一组单元格，也可以将这些单元格划分为多个部分。 布局对象将单元格排列在集合视图的内容区域中
 
 2.补充视图显示数据，但用户无法选择。 您可以使用补充视图来实现给定部分或整个集合视图的页眉和页脚视图之类的内容。 补充视图是可选的，其使用和放置由布局对象定义
 
 3.装饰视图是视觉装饰（如徽章），无法选择并且与收藏视图的数据没有固有的联系。 装饰视图是补充视图的另一种类型。 像补充视图一样，它们是可选的，它们的使用和放置由布局对象定义
 
 集合视图要求其布局对象在许多不同的时间提供这些元素的布局信息。 屏幕上出现的每个单元格和视图都使用来自布局对象的信息进行定位。 同样，每次将项目插入到集合视图中或从集合视图中删除时，都会对要添加或删除的项目进行额外的布局遍历。 但是，集合视图始终将布局限制为屏幕上可见的对象
 */
class CollectionViewLayout: UICollectionViewLayout {

    
    override init() {
        super.init()
        //当前使用此布局对象的集合视图对象
        let _ = collectionView
        //集合视图内容的宽度和高度
        let _ = collectionViewContentSize
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    /// CollectionView视图内容的宽高
    override var collectionViewContentSize: CGSize {
        /**
         子类必须重写此方法
         并使用它来返回CollectionView视图内容的宽高
         这个值代表的是所有的内容的宽高，并不是当前可见的部分
         CollectionView将会使用该值配置内容的大小来促进滚动
          这些方法提供了收集视图将内容放置在屏幕上所需的基本布局信息。 如果您的布局不支持补充视图或装饰视图，请不要实施相应的方法
         */
        guard let collectionView = collectionView else { return .zero }
        return collectionView.size
//        return CGSize(width: 20, height: 20)
    }
    
    //MARK: - 提供布局属性
    //创建布局属性对象时要使用的类
    /**
     如果将UICollectionViewLayoutAttributes子类化以管理其他布局属性，则应重写此方法并返回自定义子类。 创建新的布局属性对象时，用于创建布局属性的方法使用此类。
     此方法仅适用于子类，不需要您的代码调用
     */
    override class var layoutAttributesClass: AnyClass {
        return LayoutAttributes.self
    }
    
    /// 告诉布局对象更新当前对象
    override func prepare() {
        /**
         CollectionView会在初次布局时首先调用该方法
         CollectionView会在布局失效后、重新查询布局之前调用此方法
         子类中必须重写该方法并调用超类的方法
         布局更新会在集合视图第一次显示其内容时发生，
         并且每当布局由于视图的更改而显式或隐式无效时，都会进行布局更新。 在每次布局更新期间，集合视图都会首先调用此方法，以使您的布局对象有机会为即将进行的布局操作做准备。
         此方法的默认实现不执行任何操作。 子类可以覆盖它，并使用它来设置数据结构或执行稍后执行布局所需的任何初始计算。
         */
        super.prepare()
    }
    
    
    
    /// 检索指定矩形中所有单元格和视图的布局属性
    /// - Parameter rect: 包含目标视图的矩形（在集合视图的坐标系中指定）
    /// - Returns: UICollectionViewLayoutAttributes对象的数组，它们代表单元格和视图的布局信息。 默认实现返回nil
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        /**
         子类必须重写此方法，并使用它返回视图与指定矩形相交的所有项目的布局信息。 您的实现应返回所有视觉元素的属性，包括单元格，补充视图和装饰视图。
         创建布局属性时，请始终创建代表正确元素类型（单元，补充或装饰）的属性对象。 集合视图区分每种类型的属性，并使用该信息来决定要创建哪些视图以及如何管理它们
         */
        return []
    }
    
    /// 使用指定的单元格在指定的索引路径中检索项目的布局信息
    /// - Parameter indexPath: 项目的索引路径
    /// - Returns: 布局属性对象，其中包含要应用于项目单元格的信息
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /**
         子类必须重写此方法，并使用它返回集合视图中项目的布局信息。 您使用此方法仅提供具有相应单元格的项目的布局信息
         请勿将其用于补充视图或装饰视图
         */
        return nil
    }
    
    /// 当用户以交互方式移动项目时，检索项目的布局属性
    /// - Parameters:
    ///   - indexPath: 被移动项目的索引路径
    ///   - position: 物品在集合视图坐标系中的当前位置
    /// - Returns: 项目在指定位置时的布局属性
//    override func layoutAttributesForInteractivelyMovingItem(at indexPath: IndexPath, withTargetPosition position: CGPoint) -> UICollectionViewLayoutAttributes {
        /**
         当项目由于用户交互而移动时，布局对象使用此方法检索项目在指定位置时要用于该项目的布局属性。 此方法的默认实现返回具有两个更改的项目现有属性的副本：中心点设置为位置中的值，zIndex值设置为NSIntegerMax，以使该项目浮动在集合视图中其他项目的上方。
         子类可以重写此方法，并根据需要修改其他布局属性。 如果您重写此方法，请先调用super来检索项目的现有属性，然后对返回的结构进行更改
         */
        
//    }
    
    /// 检索指定补充视图的布局属性
    /// - Parameters:
    ///   - elementKind: 标识补充视图类型的字符串
    ///   - indexPath: 视图的索引路径
    /// - Returns: 布局属性对象，其中包含要应用于补充视图的信息
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /**
         如果您的布局对象定义了任何补充视图
         则必须重写此方法并使用它返回这些视图的布局信息
         */
        return nil
    }
    
    /// 检索指定装饰视图的布局属性
    /// - Parameters:
    ///   - elementKind: 标识装饰视图类型的字符串
    ///   - indexPath: 装饰视图的索引路径
    /// - Returns: 布局属性对象，其中包含要应用于装饰视图的信息
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /**
         如果您的布局对象定义了任何装饰视图
         则必须重写此方法并使用它返回这些视图的布局信息
         */
        return nil
    }
    
    /// 检索要在动画布局更新或更改后使用的内容偏移量
    /// - Parameter proposedContentOffset: 可见内容左上角的建议点（在集合视图的内容视图的坐标空间中）。 这表示收集视图已计算为在动画结束时最有可能使用的值
    /// - Returns: 您要改用的内容偏移量。 此方法的默认实现返回proposedContentOffset参数中的值
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        /**
         在布局更新期间或在布局之间转换时，集合视图将调用此方法，以使您有机会更改建议的内容偏移以在动画末尾使用。 如果动画或过渡可能导致项目以对您的设计而言并非最佳的方式放置，则可以覆盖此方法。
         集合视图在调用prepareLayout和collectionViewContentSize方法之后调用此方法。
         */
        return proposedContentOffset
    }
    
    /// 检索停止滚动的点
    /// - Parameters:
    ///   - proposedContentOffset: 建议的点（在集合视图的内容视图中），在该点停止滚动。 如果不进行任何调整，此值将自然停止滚动。 该点反映可见内容的左上角
    ///   - velocity: 当前沿水平和垂直轴的滚动速度。 该值以每秒的点数为单位
    /// - Returns: 您要改用的内容偏移量。 该值反映了可见区域的调整后的左上角。 此方法的默认实现返回proposalContentOffset参数中的值
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        /**
         如果希望滚动行为捕捉到特定边界，则可以覆盖此方法，并使用它来更改停止点。 例如，您可能使用此方法始终停止在项目之间的边界上滚动，而不是在项目中间停止
         */
        return proposedContentOffset
    }
    
    //MARK: - 响应 Collection View 的更新
    
    /// 通知布局对象集合视图的内容即将更改
    /// - Parameter updateItems: UICollectionViewUpdateItem对象的数组，这些对象标识正在进行的更改
    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        /**
         插入或删除项目时，集合视图会通知其布局对象，以便可以根据需要调整布局。 该过程的第一步是调用此方法，以使布局对象知道要进行的更改。 此后，将进行其他调用以收集将在集合视图周围进行动画处理的插入，删除和移动的项目的布局信息
         */
    }
    
    /// 执行集合视图更新期间需要执行的任何其他动画或清理
    override func finalizeCollectionViewUpdates() {
        /**
         收集视图将在最后对所有更改进行动画处理之前，调用此方法作为最后一步。 在用于执行所有插入，删除和移动动画的动画块中调用此方法，因此您可以根据需要使用此方法创建其他动画。 否则，您可以使用它来执行与管理布局对象的状态信息相关的所有最新任务
         */
    }
    
    /// 检索要添加到布局的补充视图的索引路径数组
    /// - Parameter elementKind: 具体类型的补充意见
    /// - Returns: 指示新补充视图位置的NSIndexPath对象数组；如果不想添加任何补充视图，则为空数组
    override func indexPathsToInsertForSupplementaryView(ofKind elementKind: String) -> [IndexPath] {
        /**
         每当您将单元格或节添加到集合视图时，集合视图都会调用此方法。 实现此方法将使您的布局对象有机会添加新的补充视图以补充添加的内容。
         集合视图在其对prepareForCollectionViewUpdates：和finalizeCollectionViewUpdates的调用之间调用此方法
         */
        return []
    }
    
    /// 检索表示装饰视图的索引路径数组，以添加
    /// - Parameter elementKind: 装修类型的具体看法
    /// - Returns: 指示新装饰视图位置的NSIndexPath对象数组；如果不想添加任何装饰视图，则为空数组
    override func indexPathsToInsertForDecorationView(ofKind elementKind: String) -> [IndexPath] {
        /**
         每当您将单元格或节添加到集合视图时，集合视图都会调用此方法。 实施此方法使您的布局对象有机会添加新的装饰视图以补充添加的内容。
         集合视图在其对prepareForCollectionViewUpdates：
         和finalizeCollectionViewUpdates的调用之间调用此方法
         */
        return []
    }
    
    
    /**
     当集合视图中的数据更改并且要插入或删除项目时，集合视图会要求其布局对象更新布局信息。 具体来说，任何移动，添加或删除的项目都必须更新其布局信息以反映其新位置。 对于移动的项目，集合视图使用标准方法来检索项目的更新的布局属性。 对于要插入或删除的项目，集合视图将调用一些不同的方法，您应该重写这些方法以提供适当的布局信息
     */
    
    /// 检索要插入到集合视图中的项目的起始布局信息
    /// - Parameter itemIndexPath: 插入项目的索引路径。 您可以使用此路径在收藏夹视图的数据源中找到该项目
    /// - Returns: 布局属性对象，描述放置相应单元格的位置
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /**
         对于要插入的任何项目，在prepareForCollectionViewUpdates：方法之后
         和finalizeCollectionViewUpdates方法之前调用此方法。 您的实现应返回描述项目初始位置和状态的布局信息。 集合视图将此信息用作任何动画的起点。 （动画的终点是项目在集合视图中的新位置。）如果返回nil，则布局对象将项目的最终属性同时用作动画的起点和终点。
         此方法的默认实现返回nil
         */
        return nil
    }
    
    /// 检索插入到集合视图中的补充视图的开始布局信息
    /// - Parameters:
    ///   - elementKind: 标识补充视图类型的字符串
    ///   - elementIndexPath: 插入项目的索引路径
    /// - Returns: 一个布局属性对象，该对象描述放置相应补充视图的位置
    override func initialLayoutAttributesForAppearingSupplementaryElement(ofKind elementKind: String, at elementIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /**
         对于要插入的任何补充视图，在prepareForCollectionViewUpdates：方法之后
         和finalizeCollectionViewUpdates方法之前调用此方法。 您的实现应返回描述视图初始位置和状态的布局信息。 集合视图将此信息用作任何动画的起点。 （动画的终点是该视图在集合视图中的新位置。）如果返回nil，则布局对象会将项目的最终属性同时用作动画的起点和终点。
         此方法的默认实现返回nil
         */
        return nil
    }
    
    /// 检索要插入到集合视图中的装饰视图的开始布局信息
    /// - Parameters:
    ///   - elementKind: 标识装饰视图类型的字符串
    ///   - decorationIndexPath: 插入项目的索引路径
    /// - Returns: 一个布局属性对象，该对象描述放置相应装饰视图的位置
    override func initialLayoutAttributesForAppearingDecorationElement(ofKind elementKind: String, at decorationIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /**
         对于要插入的任何装饰视图，在prepareForCollectionViewUpdates：方法之后和finalizeCollectionViewUpdates方法之前调用此方法。 您的实现应返回描述视图初始位置和状态的布局信息。 集合视图将此信息用作任何动画的起点。 （动画的终点是该视图在集合视图中的新位置。）如果返回nil，则布局对象会将项目的最终属性同时用作动画的起点和终点。
         此方法的默认实现返回nil
         */
        return nil
    }
    
    /// 检索表示要删除的补充视图的索引路径数组
    /// - Parameter elementKind: 具体类型的补充意见
    /// - Returns: 指示要删除的补充视图的NSIndexPath对象数组；如果不想删除给定类型的任何视图，则为空数组
    override func indexPathsToDeleteForSupplementaryView(ofKind elementKind: String) -> [IndexPath] {
        /**
         每当您删除集合视图的单元格或节时，集合视图都会调用此方法。 实现此方法将使您的布局对象有机会删除不再需要的任何补充视图。
         集合视图在其对prepareForCollectionViewUpdates：
         和finalizeCollectionViewUpdates的调用之间调用此方法
         */
        return []
    }
    
    /// 检索表示要删除的装饰视图的索引路径数组
    /// - Parameter elementKind: 装修类型的具体看法
    /// - Returns: 指示要删除的装饰视图的NSIndexPath对象数组；如果不想删除给定类型的任何视图，则为空数组
    override func indexPathsToDeleteForDecorationView(ofKind elementKind: String) -> [IndexPath] {
        /**
         每当您删除集合视图的单元格或节时，集合视图都会调用此方法。 实施此方法将使您的布局对象有机会删除不再需要的任何装饰视图。
         集合视图在其对prepareForCollectionViewUpdates：和finalizeCollectionViewUpdates的调用之间调用此方法
         */
        return []
    }
    
    /// 检索将要从集合视图中移除的项目的最终布局信息
    /// - Parameter itemIndexPath: 要删除的项目的索引路径
    /// - Returns: 布局属性对象，该对象描述了用作动画移除的终点的像元位置
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /**
         对于要删除的任何项目，在prepareForCollectionViewUpdates：方法之后
         和finalizeCollectionViewUpdates方法之前调用此方法。 您的实现应返回描述项目最终位置和状态的布局信息。 集合视图使用此信息作为所有动画的终点。 （动画的起点是项目的当前位置。）如果返回nil，则布局对象对动画的起点和终点使用相同的属性。
         此方法的默认实现返回nil
         */
        return nil
    }
    
    /// 检索将要从集合视图中移除的补充视图的最终布局信息
    /// - Parameters:
    ///   - elementKind: 标识补充视图类型的字符串
    ///   - elementIndexPath: 被删除的视图的索引路径
    /// - Returns: 一个布局属性对象，该对象描述了补充视图的位置，以用作动画移除的终点
    override func finalLayoutAttributesForDisappearingSupplementaryElement(ofKind elementKind: String, at elementIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /**
         对于将要删除的任何补充视图，在prepareForCollectionViewUpdates：方法之后
         和finalizeCollectionViewUpdates方法之前调用此方法。 您的实现应返回描述视图最终位置和状态的布局信息。 集合视图使用此信息作为所有动画的终点。 （动画的起点是视图的当前位置。）如果返回nil，则布局对象对动画的起点和终点使用相同的属性。
         此方法的默认实现返回nil
         */
        return nil
    }
    
    /// 检索将要从集合视图中移除的装饰视图的最终布局信息
    /// - Parameters:
    ///   - elementKind: 标识装饰视图类型的字符串
    ///   - decorationIndexPath: 被删除的视图的索引路径
    /// - Returns: 一个布局属性对象，该对象描述装饰视图的位置，以用作对其进行动画处理的端点
    override func finalLayoutAttributesForDisappearingDecorationElement(ofKind elementKind: String, at decorationIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        /**
         对于将要删除的任何装饰视图，在prepareForCollectionViewUpdates：方法之后和finalizeCollectionViewUpdates方法之前调用此方法。 您的实现应返回描述视图最终位置和状态的布局信息。 集合视图使用此信息作为所有动画的终点。 （动画的起点是视图的当前位置。）如果返回nil，则布局对象对动画的起点和终点使用相同的属性。
         此方法的默认实现返回nil
         */
        return nil
    }
    
    /// 当项目位于集合视图范围内的指定位置时，检索该项目的索引路径
    /// - Parameters:
    ///   - previousIndexPath: 项目的上一个索引路径。 使用此值来标识项目
    ///   - position: 集合视图范围内的目标点。 使用此值来计算项目的新索引路径
    /// - Returns: 集合视图中与指定位置对应的索引路径
    override func targetIndexPath(forInteractivelyMovingItem previousIndexPath: IndexPath, withPosition position: CGPoint) -> IndexPath {
        /**
         在项目交互移动期间，此方法将集合视图的边界矩形中的点映射到与这些点的位置相对应的索引路径。 此方法的默认实现在指定位置搜索现有单元，并返回该单元的索引路径。 如果在同一位置有多个单元格，则该方法将返回最顶部的单元格，即zIndex布局属性值最大的单元格。
         您可以根据需要重写此方法，以更改确定索引路径的方式。 例如，您可能会返回具有最低zIndex值而不是最高zIndex值的单元格的索引路径。 如果覆盖此方法，则无需调用super
         */
        return previousIndexPath
    }
    
    /**
     除了这些方法之外，您还可以覆盖prepareForCollectionViewUpdates：以处理与布局有关的所有准备工作。 您还可以覆盖finalizeCollectionViewUpdates方法，并使用该方法将动画添加到整个动画块中，或实现任何与布局有关的最终任务
     */
    
    
    /**
     使用无效上下文优化布局性能
     在设计自定义布局时，您可以通过仅使布局中实际更改的那些部分无效来提高性能。 更改项目时，调用invalidateLayout方法将强制集合视图重新计算其所有布局信息并重新应用它。 更好的解决方案是仅重新计算已更改的布局信息，这正是无效上下文允许您执行的操作。 无效上下文使您可以指定布局的哪些部分已更改。 然后，布局对象可以使用该信息来最大程度地减少重新计算的数据量
     
     要为布局定义自定义无效上下文，请子类化UICollectionViewLayoutInvalidationContext类。 在子类中，定义代表可以独立重新计算的布局数据部分的自定义属性。 当您需要在运行时使布局无效时，请创建无效上下文子类的实例，根据更改的布局信息配置自定义属性，然后将该对象传递给布局的invalidateLayoutWithContext：方法。 您对该方法的自定义实现可以使用无效上下文中的信息来仅重新计算布局中已更改的部分
     
     如果为布局对象定义了一个自定义失效上下文类，则还应该重写invalidationContextClass方法并返回自定义类。 收集视图在需要无效上下文时始终会创建您指定的类的实例。 从此方法返回您的自定义子类可确保您的布局对象始终具有其期望的无效上下文
     */
    
    //MARK: - 使布局无效
    
    /// 使当前布局无效并触发布局更新
    override func invalidateLayout() {
        /**
         您可以随时调用此方法以更新布局信息。 此方法使集合视图本身的布局无效，并立即返回。 因此，您可以从同一代码块中多次调用此方法，而无需触发多个布局更新。 实际的布局更新发生在下一个视图布局更新周期中。
         如果重写此方法，则必须在实现中的某个时刻调用super
         */
        super.invalidateLayout()
    }
    
    /// 使用提供的上下文对象中的信息使当前布局无效
    /// - Parameter context: 上下文对象，指示要刷新布局的哪些部分
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        /**
         此方法的默认实现使用UICollectionViewLayoutInvalidationContext类的基本属性优化布局过程。 如果为布局定义自定义上下文对象，请重写此方法，并将上下文对象的任何自定义属性应用于布局计算。
         如果重写此方法，则必须在实现中的某个时刻调用super
         */
        super.invalidateLayout(with: context)
    }
    
    /*
    /// 返回在为布局创建无效上下文时要使用的类
    override class var invalidationContextClass: AnyClass {
        /**
         如果您继承UICollectionViewLayout的子类并使用自定义失效上下文对象来改善布局更新的性能，请重写此方法并返回UICollectionViewLayoutInvalidationContext子类。 当集合视图需要使布局无效时，它将使用您提供的类来创建适当的无效上下文对象
         */
    }*/
    
    /// 询问布局对象新边界是否需要布局更新
    /// - Parameter newBounds: 集合视图的新边界
    /// - Returns: 如果集合视图需要更新布局，则为true；如果不需要更改布局，则为false
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        /**
         此方法的默认实现返回false。 子类可以重写它，并根据集合视图范围的更改是否需要更改单元格和补充视图的布局来返回适当的值。
         如果集合视图的边界发生变化，并且此方法返回true，则集合视图将通过调用invalidateLayout（with :)方法来使布局无效
         */
        return false
    }
    
    /// 询问布局对象，是否需要更改自定义大小的单元格以进行布局更新
    /// - Parameters:
    ///   - preferredAttributes: 单元格的preferredLayoutAttributesFittingAttributes：方法返回的布局属性
    ///   - originalAttributes: 布局对象最初为单元格建议的属性
    /// - Returns: 如果布局无效，则为是；否则，则为否
    override func shouldInvalidateLayout(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool {
        /**
         当集合视图包含自动调整大小的单元格时，在应用这些属性之前，
         将使这些单元有机会修改其自身的布局属性。 自调整大小的单元格可以这样做，以指定与布局对象提供的单元格大小不同的单元格大小。 当单元格提供一组不同的属性时，集合视图将调用此方法以确定单元格的更改是否需要较大的布局刷新。
         如果要实现自定义布局，则可以覆盖此方法，并使用它来基于指定的属性确定是否应使布局无效。 此方法的默认实现返回NO
         */
        return false
    }
    
    /// 检索一个上下文对象，该对象标识布局中应响应动态单元格更改而更改的部分
    /// - Parameters:
    ///   - preferredAttributes: 单元格的preferredLayoutAttributesFittingAttributes：方法返回的布局属性
    ///   - originalAttributes: 布局对象最初为单元格建议的属性
    /// - Returns: 无效上下文，其中包含有关需要对布局进行哪些更改的信息
    override func invalidationContext(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutInvalidationContext {
        /**
         此方法的默认实现创建invalidationContextClass类方法提供的类的实例并返回它。 如果要在布局中使用自定义无效上下文对象，请始终重写该方法并返回自定义类。
         子类可以覆盖此方法，并使用它在返回无效上下文之前对其进行其他配置。 在您的自定义实现中，调用super，以便父类可以执行对象的基本配置
         */
        return super.invalidationContext(forPreferredLayoutAttributes: preferredAttributes, withOriginalAttributes: originalAttributes)
    }
    
    /// 检索一个上下文对象，该对象标识在布局中以交互方式移动的项目
    /// - Parameters:
    ///   - targetIndexPaths: 当前正在移动的物品的位置
    ///   - targetPosition: 集合视图的坐标系中的点，即项目的潜在放置点
    ///   - previousIndexPaths: 所移动项目的先前位置
    ///   - previousPosition: 集合视图的坐标系中的上一点。 这是先前用于确定物料放置点的点
    /// - Returns: 无效上下文，其中包含有关需要对布局进行哪些更改的信息
    override func invalidationContext(forInteractivelyMovingItems targetIndexPaths: [IndexPath], withTargetPosition targetPosition: CGPoint, previousIndexPaths: [IndexPath], previousPosition: CGPoint) -> UICollectionViewLayoutInvalidationContext {
        /**
         当一个或多个项目的交互式移动正在进行时，布局对象使用此方法来检索无效上下文。 缺省实现创建一个由invalidationContextClass类方法提供的类的实例，并用提供的信息填充该类的实例，然后将其返回。 如果要在布局中使用自定义无效上下文对象，请始终重写该方法并返回自定义类。
         子类可以覆盖此方法，并使用它在返回无效上下文之前对其进行其他配置。 在您的自定义实现中，调用super，以便父类可以执行对象的基本配置
         */
        return super.invalidationContext(forInteractivelyMovingItems: targetIndexPaths, withTargetPosition: targetPosition, previousIndexPaths: previousIndexPaths, previousPosition: previousPosition)
    }
    
    
    /// 检索一个上下文对象，该对象标识已移动的项目
    /// - Parameters:
    ///   - indexPaths: 物品的最终位置。 对于取消的交互，这些索引路径对应于项目的原始索引路径
    ///   - previousIndexPaths: 项目的先前位置。 此参数包含在移动序列中由集合视图报告的最后一组索引路径
    ///   - movementCancelled: 一个布尔值，指示交互运动是成功结束还是被取消
    /// - Returns: 无效上下文，其中包含有关需要对布局进行哪些更改的信息
    override func invalidationContextForEndingInteractiveMovementOfItems(toFinalIndexPaths indexPaths: [IndexPath], previousIndexPaths: [IndexPath], movementCancelled: Bool) -> UICollectionViewLayoutInvalidationContext {
        /**
         当一个或多个项目的交互式移动结束时，由于移动成功或被用户取消，因此布局对象使用此方法来检索无效上下文。 缺省实现创建一个由invalidationContextClass类方法提供的类的实例，并用提供的信息填充该类的实例，然后将其返回。 如果要在布局中使用自定义无效上下文对象，请始终重写该方法并返回自定义类。
         子类可以覆盖此方法，并使用它在返回无效上下文之前对其进行其他配置。 在您的自定义实现中，调用super，以便父类可以执行对象的基本配置
         */
        super.invalidationContextForEndingInteractiveMovementOfItems(toFinalIndexPaths: indexPaths, previousIndexPaths: previousIndexPaths, movementCancelled: movementCancelled)
    }
    
    //MARK: - 协调动画更改
    
    /// 准备布局对象，以便对视图范围进行动画更改或插入或删除项目
    /// - Parameter oldBounds: 集合视图的当前范围
    override func prepare(forAnimatedBoundsChange oldBounds: CGRect) {
        /**
         集合视图在对视图的边界进行任何动画更改之前或在动画插入或删除项目之前调用此方法。 该方法是布局对象进行必要的计算以准备那些动画更改所需的机会。 具体来说，您可以使用此方法来计算插入或删除的项目的初始或最终位置，以便在需要时可以返回这些值。
         您也可以使用此方法执行其他动画。 您创建的所有动画都会添加到用于处理插入，删除和边界更改的动画块中
         */
    }
    
    /// 在对视图的边界进行任何动画更改之后，或者在插入或删除项目后进行清理
    override func finalizeAnimatedBoundsChange() {
        /**
         集合视图在创建用于更改视图范围的动画之后，或者在动画插入或删除项目之后调用此方法。 此方法是布局对象进行与这些操作相关的任何清理的机会。
         您也可以使用此方法执行其他动画。 您创建的所有动画都会添加到用于处理插入，删除和边界更改的动画块中
         */
    }
    
    //MARK: - 布局之间的过渡
    
    /// 告诉布局对象准备作为集合视图的布局安装
    /// - Parameter oldLayout: 在过渡开始时，将布局对象安装在集合视图中。 您可以使用此对象根据起始布局对象提供不同的结束属性
    override func prepareForTransition(from oldLayout: UICollectionViewLayout) {
        /**
         在执行布局转换之前，集合视图会调用此方法，以便您的布局对象可以执行生成布局属性所需的任何初始计算
         */
    }
    
    /// 告诉布局对象它将作为集合视图的布局被删除
    /// - Parameter newLayout: 过渡结束时要在集合视图中安装的布局对象。 您可以使用此对象来提供不同的起始属性，具体取决于最终的布局对象
    override func prepareForTransition(to newLayout: UICollectionViewLayout) {
        /**
         在执行布局转换之前，集合视图会调用此方法，以便您的布局对象可以执行生成布局属性所需的任何初始计算
         */
    }
    
    /// 告诉布局对象在过渡动画发生之前执行任何最后的步骤
    override func finalizeLayoutTransition() {
        /**
         在收集视图以执行从一种布局到另一种布局的过渡所需的所有布局属性之后，集合视图将调用此方法。 您可以使用此方法清除由prepareForTransition（from :)或prepareForTransition（to :)方法的实现创建的任何数据结构或缓存
         */
    }
    
    //MARK: - 注册装饰视图
    
    /// 注册一个类，以用于为集合视图创建装饰视图
    /// - Parameters:
    ///   - viewClass: 用于补充视图的类
    ///   - elementKind: 装饰视图的元素种类。 您可以使用此字符串来区分布局中用途不同的装饰视图。 此参数不能为nil，并且不能为空字符串
    override func register(_ viewClass: AnyClass?, forDecorationViewOfKind elementKind: String) {
        /**
         此方法使布局对象有机会注册装饰视图以供在集合视图中使用。 装饰视图为分区或整个集合视图提供视觉装饰，但不以其他方式绑定到集合视图的数据源提供的数据。
         您无需显式创建装饰视图。 注册一个后，由布局对象决定何时需要装饰视图，并从其layoutAttributesForElements（in :)方法返回相应的布局属性。 对于指定装饰视图的布局属性，集合视图创建（或重用）视图并根据注册的信息自动显示它。
         如果您以前使用相同类型的字符串注册了类或nib文件，则在viewClass参数中指定的类将替换旧条目。 如果要注销装饰视图，可以为viewClass指定nil
         */
    }
    
    /// 注册NIB文件以用于创建收藏视图的装饰视图
    /// - Parameters:
    ///   - nib: 包含单元格定义的Nib对象。 nib文件必须仅包含一个顶级对象，并且该对象的类型必须为UICollectionReusableView
    ///   - elementKind: 装饰视图的元素种类。 您可以使用此字符串来区分布局中用途不同的装饰视图。 此参数不能为nil，并且不能为空字符串
    override func register(_ nib: UINib?, forDecorationViewOfKind elementKind: String) {
        /**
         此方法使布局对象有机会注册装饰视图以供在集合视图中使用。 装饰视图为分区或整个集合视图提供视觉装饰，但不以其他方式绑定到集合视图的数据源提供的数据。
         您无需显式创建装饰视图。 注册一个后，由布局对象决定何时需要装饰视图，并从其layoutAttributesForElements（in :)方法返回相应的布局属性。 对于指定装饰视图的布局属性，集合视图创建（或重用）视图并根据注册的信息自动显示它。
         如果您以前使用相同类型的字符串注册了类或nib文件，则在viewClass参数中指定的类将替换旧条目。 如果要注销装饰视图，可以为viewClass指定nil
         */
    }
    
    //MARK: - 支持从右到左的布局
    
    /// 设计自定义布局时使用的语言方向
    override var developmentLayoutDirection: UIUserInterfaceLayoutDirection {
        /**
         该属性的默认值是与主包的开发区域相关的语言所使用的布局方向。 子类可以覆盖此属性并返回不同的值
         */
        return .leftToRight
    }
    
    /// 一个布尔值，指示是否在适当的时间自动翻转了水平坐标系
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        /**
         在开发过程中使用的语言自然会影响您在配置布局对象时所做的决策。 当使用从左到右的语言进行开发时，布局信息将自动匹配集合视图的自然坐标系。 但是，当用户的语言是从右到左的方向时，您提供的布局信息仍然基于集合视图的自然坐标系。 这种差异会导致使用相反方向的语言出现布局问题。 当此属性设置为true时，集合视图将自动翻转其水平坐标系的方向以匹配当前语言的前沿。 （developmentLayoutDirection属性指定用于设计布局的布局方向。）翻转水平坐标系将有效地翻转现有的布局信息，这将使外观更好看。
         此属性的默认值为false
         */
        return false
    }
    
}
