<form action="{{ isset($expenseCategory) ? route('expense-categories.update', $expenseCategory) : route('expense-categories.store') }}" method="POST"
    enctype="multipart/form-data" role="form">
    @csrf
    @isset($expenseCategory)
        @method('PUT')
    @endisset

    <div class="mb-3">
        <label for="name" class="form-label">@lang('Expense Category Name')</label>
        <input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="name"
            value="{{ old('name', isset($expenseCategory) ? $expenseCategory->name : '') }}">
        @error('name')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>

    <x-number-input label="Sort Order" name="sort_order"
        value="{{ old('sort_order', isset($expenseCategory) ? $expenseCategory->sort_order : '') }}" />

    <div class="mb-3">
        <label for="status" class="form-label">@lang('Status_1')</label>
        <select class="form-select @error('status') is-invalid @enderror" id="status" name="status">
            @isset($expenseCategory)
                <option value="1" @if ($expenseCategory->is_active) selected @endif>@lang('Active')</option>
                <option value="0" @if (!$expenseCategory->is_active) selected @endif>@lang('Inactive')</option>
            @else
                <option value="1">@lang('Active')</option>
                <option value="0">@lang('Inactive')</option>
            @endisset
        </select>
        @error('status')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @else
            <div id="statusHelp" class="form-text">
                @lang('Inactive categories will not appear in expense tracking.')
            </div>
        @enderror
    </div>

    <!--<div class="mb-3">-->
    <!--    <label for="description" class="form-label">@lang('Description')</label>-->
    <!--    <textarea name="description" class="form-control @error('description') is-invalid @enderror" id="description"-->
    <!--        rows="3">{{ old('description', isset($expenseCategory) ? $expenseCategory->description : '') }}</textarea>-->
    <!--    @error('description')-->
    <!--        <div class="invalid-feedback">-->
    <!--            {{ $message }}-->
    <!--        </div>-->
    <!--    @enderror-->
    <!--</div>-->

    <div class="mb-3">
        <x-save-btn>
            @lang(isset($expenseCategory) ? 'Update Expense Category' : 'Save Expense Category')
        </x-save-btn>
    </div>
</form>
